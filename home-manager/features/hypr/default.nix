{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with builtins;
with lib;
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings =
      with config.custom.theme;
      let
        width = 2560;
        height = 1080;
      in
      import ./env.nix
      // import ./binds.nix lib
      // import ./general.nix style
      // import ./animations.nix
      // import ./rules.nix lib style
      // {
        monitor = "HDMI-A-1, ${toString width}x${toString height}@60, 0x0, 1";
        exec-once =
          [
            "hyprpaper; hypridle"
            "hyprctl dispatch movecursor ${toString (width / 2)} ${toString (height / 2)}"
          ]
          ++ (optional (elem pkgs.wl-gammarelay-rs config.home.packages) "wl-gammarelay-rs run")
          ++ (optional (elem pkgs.eww config.home.packages) "eww daemon; eww open mainbar; update-volume; update-mute; change-light-mode");
      };
    extraConfig = import ./config.nix;
  };

  home.packages = with pkgs; [
    hypridle
    hyprpaper
  ];
  xdg.configFile."hypr/hypridle.conf".text = ''
    listener {
      timeout = 170
      on-timeout = idle-brightness
      on-resume = resume-brightness
    }
    listener {
      timeout = 180
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }
    listener {
      timeout = 900
      on-timeout = idle-brightness
      on-resume = resume-brightness
    }
  '';
}
