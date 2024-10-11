{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "~/Pictures/the-water-barriers-xb-2560x1080.jpg" ];
      wallpaper = [ "HDMI-A-1,~/Pictures/the-water-barriers-xb-2560x1080.jpg" ];
    };
  };
}
