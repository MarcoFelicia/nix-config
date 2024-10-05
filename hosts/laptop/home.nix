{ pkgs, ... }:
{
  home.packages = with pkgs; [ gnome.file-roller ];

  custom.defaultShellCommand = "zsh";
}
