{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = import ./config.nix // import ./keybinds.nix;
  };
  xdg.configFile."rofi/base.rasi".text = import ./base.nix config.custom.theme lib;
  xdg.configFile."rofi/themes".source = ./themes;
}
