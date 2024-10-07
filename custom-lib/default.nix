{ inputs }:
with inputs.nixpkgs.lib;
with builtins;
rec {
  getPkgs =
    system: stable:
    import inputs."${if stable then "nixpkgs" else "nixpkgs-unstable"}" { inherit system ; };

  filesIn = path: (map (name: path + "/${name}") (attrNames (readDir path)));
  dirsIn =
    path:
    (map (name: path + "/${name}") (
      attrNames (filterAttrs (_: value: value == "directory") (readDir path))
    ));
  subDirName = path: last (splitString "/" (toString path));

  recursiveReadDir =
    path:
    map (
      subPath:
      if hasSuffix "::directory" subPath then
        recursiveReadDir (path + "/${removeSuffix "::directory" subPath}")
      else
        path + "/${removeSuffix "::regular" subPath}"
    ) (attrValues (mapAttrs (name: value: "${name}::${value}") (readDir path)));
  recursiveFilesIn = path: flatten (recursiveReadDir path);

  mkOptionsForFiles = path: mapAttrs (_: _: { enable = mkEnableOption ""; }) (readDir path);
  enableOptions =
    list:
    listToAttrs (
      map (el: {
        name = el;
        value = {
          enable = mkDefault true;
        };
      }) list
    );
  filterNonExistingOption =
    options: list: intersectLists (mapAttrsToList (name: _: name) options) list;
  mergeConfigs =
    cfg: path: args:
    mkMerge (map (el: mkIf (cfg.${subDirName el}.enable) ((import el) args)) (dirsIn path));

  hideDesktopEntries =
    entries:
    listToAttrs (
      map (el: {
        name = el;
        value = {
          name = "";
          noDisplay = true;
        };
      }) entries
    );
}
