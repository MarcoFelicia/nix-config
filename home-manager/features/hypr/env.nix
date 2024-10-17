{
  env = [
    "GDK_BACKEND,wayland,x11,*"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"

    "MAX_WORKSPACE, 5"

    "VOLUME_STEP,2"
    "BRIGHTNESS_STEP, 0.1"

    "DAY_BRIGHTNESS, 1"
    "NIGHT_BRIGHTNESS, 0.8"
    "DAY_TEMPERATURE, 6500"
    "NIGHT_TEMPERATURE, 5500"
    "DAY_NIGHT_UPDATE_INTERVAL, 3600"

    "CLIP_TIME, 60"
  ];
  "$mod" = "SUPER";
  "$terminal" = "kitty";
  "$resize_step" = "50";
}
