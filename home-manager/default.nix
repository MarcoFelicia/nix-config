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
  imports = [
    ./theme.nix
    ./options.nix
  ] ++ (filesIn ./common);

  home.packages = flatten (
    map (
      path:
      let
        name = subDirName path;
      in
      if hasSuffix ".sh" name then
        pkgs.writeShellScriptBin (removeSuffix ".sh" name) (readFile path)
      else if name == "requires.nix" then
        import path pkgs
      else
        warn "Unexpected ${path} in scripts/ directory"
    ) (recursiveFilesIn ./scripts)
  );

  custom = {
    features = enableOptions (filterNonExistingOption config.custom.features features);
    scripts = enableOptions ((filterNonExistingOption config.custom.scripts features) ++ [ "flake" ]);
  };

  xdg = {
    desktopEntries = { } // (with config.custom.features; hideDesktopEntries ([ "nixos-manual" ]));
  };
}
