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
      extra ? { },
    }:
    mapAttrs (
      name: _:
      ({ enable = mkEnableOption ""; } // (optionalAttrs (hasAttrByPath [ name ] extra) extra.${name}))
    ) (readDir path);
  enableOptions =
    list:
    listToAttrs (
      map (opt: {
        name = opt;
        value = {
          enable = mkDefault true;
        };
      }) list
    );
  filterNonExistingOption =
    options: list: intersectLists (mapAttrsToList (name: _: name) options) list;
  mergeConfigs =
    cfg: path: args:
    mkMerge (map (opt: mkIf (cfg.${subDirName opt}.enable) ((import opt) args)) (dirsIn path));

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
