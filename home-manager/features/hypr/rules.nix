lib: style: with style; {
  windowrulev2 = [
    "noborder, class:(firefox)"
    "rounding ${toString (window_border + window_rounding + 1)}, class:(firefox)"
    "noblur, class:(firefox)"
    "opacity 1 override, class:(firefox)"
    "float, class:(firefox), title:(Library)"
    "size 1280 720, class:(firefox), title:(Library)"
    "size 1280 720, class:(firefox), title:(Save As)"

    "float, class:(kitty)"
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
