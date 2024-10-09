{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
with lib;
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      bookmarks = import ./bookmarks.nix;
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        istilldontcareaboutcookies
      ];
      search = import ./search.nix;
      settings = import ./settings.nix lib config;
    };
  };
  home.file = mkIf config.custom.features.firefox.customCss {
    ".mozilla/firefox/default/chrome".source = ./css;
  };
}
