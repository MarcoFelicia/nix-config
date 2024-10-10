lib:
with builtins;
with lib;
let
  switchWorkspace = increment: "exec, switch-workspace ${increment}";
  directionMap = {
    "l" = "Left";
    "r" = "Right";
    "u" = "Up";
    "d" = "Down";
  };
  windowFuncs = [
    (
      direction: key:
      "$mod, ${key}, exec, hyprctl dispatch movefocus ${direction} && hyprctl dispatch alterzorder top"
    )
    (direction: key: "$mod+SHIFT, ${key}, movewindow, ${direction}")
  ];
  windowBinds = flatten (
    mapAttrsToList (direction: key: map (func: func direction key) windowFuncs) directionMap
  );

  workspaceRange = {
    start = 1;
    end = 9;
  };
  workspaceFuncs = [
    (id: "$mod, ${id}, workspace, ${id}")
    (id: "$mod+SHIFT, ${id}, movetoworkspace, ${id}")
  ];
  workspaceBinds = flatten (
    map (id: map (func: func (toString id)) workspaceFuncs) (
      range workspaceRange.start workspaceRange.end
    )
  );
in
{
  bind = [
    "$mod, Return, exec, [float; center] $terminal"
    "$mod, Super_L, exec, apps-launcher"
    "$mod, E, exec, [float; center; size 1280 720] $terminal yazi"
    "$mod+SHIFT, Q, killactive"

    "$mod, Space, exec, hyprctl dispatch togglefloating && hyprctl dispatch centerwindow"

    "ALT, Tab, exec, hyprctl dispatch focuscurrentorlast && hyprctl dispatch alterzorder top"

    "$mod, N, workspace, empty"

    "$mod, Page_Down, ${switchWorkspace "+"}"
    "$mod, Page_Up, ${switchWorkspace "-"}"
    "$mod, mouse_up, ${switchWorkspace "+"}"
    "$mod, mouse_down, ${switchWorkspace "-"}"

    "$mod+SHIFT, Page_Down, movetoworkspace, +1"
    "$mod+SHIFT, Page_Up, movetoworkspace, -1"
    "$mod+SHIFT, mouse_up, movetoworkspace, +1"
    "$mod+SHIFT, mouse_down, movetoworkspace, -1"

    ", XF86AudioMute, exec, toogle-mute"

    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
  ] ++ windowBinds ++ workspaceBinds;

  binde = [
    "$mod+CTRL, Left, resizeactive, -$resize_step 0"
    "$mod+CTRL, Right, resizeactive, $resize_step 0"
    "$mod+CTRL, Up, resizeactive, 0 -$resize_step"
    "$mod+CTRL, Down, resizeactive, 0 $resize_step"

    ", XF86AudioRaiseVolume, exec, set-volume up"
    ", XF86AudioLowerVolume, exec, set-volume down"

    ", XF86MonBrightnessUp, exec, set-brightness up"
    ", XF86MonBrightnessDown, exec, set-brightness down"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
}
