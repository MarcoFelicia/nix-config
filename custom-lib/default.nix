{ inputs }:
with inputs.nixpkgs.lib;
with builtins;
rec {
  getPkgs =
    system: stable:
    import inputs."${if stable then "nixpkgs" else "nixpkgs-unstable"}" { inherit system; };

  filesIn = path: (map (name: path + "/${name}") (attrNames (readDir path)));
  dirsIn =
    path:
    (map (name: path + "/${name}") (
      attrNames (filterAttrs (_: value: value == "directory") (readDir path))
    ));
  subDirName = path: last (splitString "/" (toString path));
  recursiveFilesIn =
    path:
    flatten (
      attrValues (
        mapAttrs (
          name: value:
          if value == "directory" then recursiveFilesIn (path + "/${name}") else "${path}/${name}"
        ) (readDir path)
      )
    );

  mkOptionsForFiles =
    {
      path,
      args ? "",
    }:
    mapAttrs (
      name: _:
      (
        {
          enable = mkEnableOption "";
        }
        // (if args != "" then (import (path + "/${name}") args).options or { } else { })
      )
    ) (readDir path);
  enableOptions =
    list:
    listToAttrs (
      map (option: {
        name = option;
        value = {
          enable = mkDefault true;
        };
      }) list
    );
  filterNonExistingOption =
    options: list: intersectLists (mapAttrsToList (name: _: name) options) list;
  mergeConfigs =
    options: path: args:
    mkMerge (
      map (
        option:
        let
          module = (import option) args;
          imports = map (subModule: (import subModule) args) (module.imports or [ ]);
          config = mkMerge (
            [ (filterAttrs (name: _: name != "imports" && name != "options") module) ] ++ imports
          );
        in
        mkIf (options.${subDirName option}.enable) config
      ) (dirsIn path)
    );

  hideDesktopEntries =
    entries:
    listToAttrs (
      map (opt: {
        name = opt;
        value = {
          name = "";
          noDisplay = true;
        };
      }) entries
    );
}
