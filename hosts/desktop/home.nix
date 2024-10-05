{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wev
    trashy
    nurl
  ];

  custom.defaultShellCommand = "zsh";
}
