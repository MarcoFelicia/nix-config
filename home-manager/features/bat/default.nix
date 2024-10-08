{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batman ];
    config = {
      style = "plain";
      theme = optionalString config.custom.theme.bat.enable "custom";
      tabs = "2";
      pager = "less -imR --jump-target=.5";
    };
    themes = {
      custom = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d3feec47b16a8e99eabb34cdfbaa115541d374fc";
          hash = "sha256-s0CHTihXlBMCKmbBBb8dUhfgOOQu9PBCQ+uviy7o47w=";
        };
        file = "themes/${config.custom.theme.paletteName}.tmTheme";
      };
    };
  };
}
