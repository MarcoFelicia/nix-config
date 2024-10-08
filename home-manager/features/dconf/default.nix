{ lib, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [ "" ];
      app-picker-layout = [ "" ];
      disable-user-extensions = true;
    };
    "org/gnome/desktop/sound".event-sounds = false;
    "org/gnome/desktop/app-folders".folder-children = [ "" ];
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.45;
      tap-to-click = true;
      two-finger-scrolling-enable = true;
    };
    "org/gnome/desktop/privacy" = {
      old-files-age = lib.hm.gvariant.mkUint32 30;
      recent-files-max-age = 30;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
  };
}
