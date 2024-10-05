{ pkgs, lib, ... }:
with lib;
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
    };
  };

  # core-service
  services.dleyna-renderer.enable = false;
  services.dleyna-server.enable = false;
  services.gnome.gnome-online-accounts.enable = false;
  services.hardware.bolt.enable = false;

  # core-shell
  services.colord.enable = false;
  services.gnome.gnome-browser-connector.enable = false;
  services.gnome.gnome-initial-setup.enable = false;
  services.gnome.gnome-remote-desktop.enable = false;
  services.gnome.gnome-user-share.enable = false;
  services.gnome.rygel.enable = false;
  services.avahi.enable = false;
  services.geoclue2.enable = false;

  environment.gnome.excludePackages =
    with pkgs;
    with pkgs.gnome;
    [
      orca

      # adwaita-icon-theme
      # gnome-backgrounds
      # gnome-bluetooth
      gnome-color-manager
      # gnome-control-center
      gnome-shell-extensions
      gnome-tour
      gnome-user-docs
      # glib # for gsettings program
      gnome-menus
      # gtk3.out # for gtk-launch program
      # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/

      baobab # Disk usage analyzer
      epiphany
      gnome-text-editor
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-console
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      loupe # image viewer
      # nautilus
      gnome-connections
      simple-scan
      snapshot # camera
      totem # video player
      yelp # help viewer

      evince
      file-roller # Archive manager
      geary
      gnome-disk-utility
      seahorse
      sushi # nautilus previewer
    ];

  services.xserver.excludePackages = [ pkgs.xterm ];

  programs.bash.vteIntegration = false;
  programs.zsh.vteIntegration = false;
}
