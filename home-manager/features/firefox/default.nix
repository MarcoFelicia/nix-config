{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
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
  home.file = {
    ".mozilla/firefox/default/chrome".source = ./css;
  };
}
