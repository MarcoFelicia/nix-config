{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = [ pkgs.eww ];

  xdg.configFile = with config.custom.theme; {
    "eww/yucks".source = ./yucks;
    "eww/scss".source = ./scss;
    "eww/eww.yuck".text = builtins.readFile ./eww.yuck;
    "eww/eww.scss".text =
      with style;
      ''
        $window-padding: ${toString window_padding}px;
        $window-rounding: ${toString window_rounding}px;

        $bar-bg: rgba($color: #${status_bar}, $alpha: ${toString opacity});
        $panel-bg: rgba($color: #${panel}, $alpha: ${toString opacity});
        $popup-bg: rgba($color: #${popup}, $alpha: ${toString opacity});
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

        ${builtins.concatStringsSep "\n" (
          lib.attrsets.mapAttrsToList (name: color: "\$${name}: #${color};") palette
        )}
      ''
      + builtins.readFile ./eww.scss;
  };
}
