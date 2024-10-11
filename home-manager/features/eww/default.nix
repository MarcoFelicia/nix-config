{
  pkgs,
  lib,
  config,
  ...
}:
with config.custom.theme;
{
  home.packages = [ pkgs.eww ];

  xdg.configFile = {
    "eww/yucks".source = ./yucks;
    "eww/scss".source = ./scss;
    "eww/eww.yuck".text = builtins.readFile ./eww.yuck;
    "eww/eww.scss".text =
      ''
        $window-padding: ${toString window_padding}px;
        $window-rounding: ${toString window_rounding}px;

        $bar-bg: rgba($color: #${status_bar}, $alpha: ${toString (opacity - 5.0e-2)});
        $menu-bg: #${menu};
        $osd-bg: #${osd};
        $color: #${text};

        $hover: rgba($color: #${hover}, $alpha: ${toString hover_opacity});

        $button: #${button};

        $progress-trough: #${progress_trough};
        $progress-highlight: #${progress_highlight};

        $selected: #${selected};
        $selected-color: #${selected_text};

        $disabled-color: #${disabled_text};

        $border: #${border};

        $shadow: #${shadow};

        $yellow: #${yellow};
      ''
      + builtins.readFile ./eww.scss;
  };
}
