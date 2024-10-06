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
      settings = import ./settings.nix config.style;
    };
  };
  home.file = mkIf config.custom.theme.firefox.enable {
    ".mozilla/firefox/default/chrome".source = ./css;
  };
}
