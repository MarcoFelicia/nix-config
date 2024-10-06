{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wev
    trashy
    nurl
  ];

  custom.defaultShellCommand = "zsh";
  custom.theme.bat.enable = true;
  custom.theme.firefox.enable = true;
}
