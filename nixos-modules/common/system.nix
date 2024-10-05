{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "24.05";

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  systemd.services.NetowrkManager-wait-online.enable = false;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.udisks2.enable = true;
}
