trap "eww close fullscreen_overlay" EXIT

eww update close_fullscreen_overlay="pkill rofi"
eww open fullscreen_overlay

rofi -show drun -theme 'app-launcher'