lib:
with lib;
let
  submaps = {
    layout = {
      key = "L";
      bind = [
        ", Left, layoutmsg, orientationleft"
        ", Right, layoutmsg, orientationright"
        ", Up, layoutmsg, orientationtop"
        ", Down, layoutmsg, orientationbottom"
      ];
    };
    power = {
      key = "Escape";
      bind = [
        ", S, exec, systemctl suspend"
        ", R, exec, reboot"
        ", P, exec, poweroff"
      ];
    };
  };
in
concatStringsSep "\n" (
  flatten (
    mapAttrsToList (name: value: [
      "bind = $mod, ${value.key}, exec, open-osd ${name}_osd && hyprctl dispatch submap ${name}"
      "submap = ${name}"
      (map (bind: "bind = ${bind}") value.bind)
      "bind = , escape, exec, close-osd && hyprctl dispatch submap reset"
      "submap = reset"
    ]) submaps
  )
  ++ [ ]
)
