theme: lib:
with theme;
let
  alpha = opacity: lib.trivial.toHexString (builtins.floor (opacity * 255));
in
''
  * {
    panel-bg: #${app_launcher}${alpha opacity};
    input-bg: #${input};
    selected: #${selected};
    normal-color: #${text};
    selected-color: #${selected_text};
    icon-bg: #dce0e8;
    hover: #${hover}${alpha hover_opacity};

    rounding: ${toString window_rounding}px;

    background-color: transparent;
    font: "Quicksand 12";
    text-color: @normal-color;
    text-transform: bold;
  }
''
