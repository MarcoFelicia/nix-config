{
  pkgs,
  lib,
  customLib,
  config,
  features,
  ...
}:
with customLib;
with lib;
{
  imports = bundleModules ./.;

  home.packages = flatten (
    map (
      path:
      let
        name = subDirName path;
      in
      if config.custom.scripts.${name}.enable then
        (map (
          subPath:
          let
            name = subDirName subPath;
          in
          if hasSuffix ".sh" name then
            pkgs.writeShellScriptBin (removeSuffix ".sh" name) (readFile subPath)
          else if name == "requires.nix" then
            import subPath pkgs
          else
            warn "Unexpected ${subPath} in scripts/ directory"
        ) (recursiveallIn path))
      else
        [ ]
    ) (dirsIn ./scripts)
  );

  custom = {
    features = enableOptions (filterNonExistingOption config.custom.features features);
    scripts = enableOptions ((filterNonExistingOption config.custom.scripts features) ++ [ "flake" ]);
  };

  xdg = {
    desktopEntries = { } // (with config.custom.features; hideDesktopEntries ([ "nixos-manual" ]));
  };
}
