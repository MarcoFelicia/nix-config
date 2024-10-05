{ lib, config, ... }:
{
  programs = {
    kitty = with config.custom.theme; {
      enable = true;
      settings = import ./settings.nix config;
      extraConfig = import ./theme.nix style palette + import ./config.nix;
    };
  };
}
