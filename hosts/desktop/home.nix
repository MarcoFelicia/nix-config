{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wev
    trashy
    nurl
  ];

  custom = {
    features = {
      firefox.customCss = true;
      bat.customTheme = true;
    };

    defaultShellCommand = "zsh";
  };
}
