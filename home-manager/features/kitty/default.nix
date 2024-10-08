{ lib, config, ... }:
with config.custom;
{
  programs = {
    kitty = {
      enable = true;
      settings = import ./settings.nix config;
      extraConfig = import ./theme.nix theme + import ./config.nix;
    };
  };
}
