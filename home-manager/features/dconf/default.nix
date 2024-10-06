{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [ "" ];
      app-picker-layout = [ "" ];
      disable-user-extensions = true;
    };
    "org/gnome/desktop/sound".event-sounds = false;
    "org/gnome/desktop/app-folders".folder-children = [ "" ];
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
    };
  };
}
