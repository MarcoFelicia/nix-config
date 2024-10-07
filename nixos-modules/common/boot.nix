{ lib, ... }:
{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
    efi.canTouchEfiVariables = true;
    timeout = lib.mkDefault 3;
  };
}
