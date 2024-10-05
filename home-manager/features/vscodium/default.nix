{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
