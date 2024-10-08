{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with builtins;
with lib;
with config.custom;
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings =
      let
        width = 2560;
        height = 1080;
      in
      import ./env.nix
      // import ./binds.nix lib
      // import ./general.nix theme
      // import ./animations.nix
      // import ./rules.nix lib theme
      // {
        monitor = "HDMI-A-1, ${toString width}x${toString height}@60, 0x0, 1";
        exec-once =
          [ "hyprctl dispatch movecursor ${toString (width / 2)} ${toString (height / 2)}" ]
          ++ (optional (elem pkgs.wl-gammarelay-rs config.home.packages) "wl-gammarelay-rs run")
          ++ (optional (elem pkgs.eww config.home.packages) "eww daemon;  eww open mainbar; update-volume; update-mute; change-light-mode");
      };
    extraConfig = import ./config.nix;
  };
}
// (import ./hypridle.nix)
// (import ./hyprpaper.nix)
