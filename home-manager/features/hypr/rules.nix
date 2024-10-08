lib: theme: with theme; {
  windowrulev2 = [
    "noborder, fullscreenstate:1"
    "noborder, floating:1"

    "opacity 1 override, class:(firefox)"
    "float, class:(firefox), title:(Library)"
    "size 1280 720, class:(firefox), title:(Library)"
    "size 1280 720, class:(firefox), title:(Save As)"

    "float, class:(kitty)"
    "noborder off, class:(kitty)"
  ];

  layerrule =
    let
      min_opacity = toString (lib.trivial.max (opacity - 0.1) 0);
    in
    [
      "blur, rofi"
      "ignorealpha ${min_opacity}, rofi"

      "blur, eww"
      "ignorealpha ${min_opacity}, eww"
    ];
}
