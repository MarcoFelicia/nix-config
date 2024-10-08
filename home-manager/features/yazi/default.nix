{ lib, config, ... }:
with lib;
with config.custom;
{
  programs.yazi = mkMerge [
    {
      enable = true;
      settings = import ./settings.nix;
      keymap = import ./keymap.nix;
      theme = import ./theme.nix theme;
    }
    (optionalAttrs (hasAttrByPath [ "initLua" ] config.programs.yazi) {
      initLua = import ./initLua.nix theme;
    })
  ];
  xdg.configFile."yazi/plugins".source = ./plugins;
}
