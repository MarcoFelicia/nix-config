{ lib, config, ... }:
with lib;
with config.custom.theme;
{
  programs.yazi = mkMerge [
    {
      enable = true;
      settings = import ./settings.nix;
      keymap = import ./keymap.nix;
      theme = import ./theme.nix style palette;
    }
    (optionalAttrs (hasAttrByPath [ "initLua" ] config.programs.yazi) {
      initLua = import ./initLua.nix style palette;
    })
  ];
  xdg.configFile."yazi/plugins".source = ./plugins;
}
