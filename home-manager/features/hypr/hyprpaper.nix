{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "~/Pictures/nixos.png" ];
      wallpaper = [ "HDMI-A-1,~/Pictures/nixos.png" ];
    };
  };
}
