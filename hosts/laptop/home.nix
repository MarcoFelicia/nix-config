{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    gnome.file-roller
    microsoft-edge
  ];

  custom.defaultShellCommand = "zsh";
}
