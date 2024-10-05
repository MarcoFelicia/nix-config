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
    extensions = with pkgs; [ vscode-extensions.jnoortheen.nix-ide ];
  };
}
