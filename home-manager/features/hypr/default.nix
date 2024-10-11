{
  pkgs,
  lib,
  config,
  inputs,
  monitor ? { },
  ...
}:
with builtins;
with lib;
with config.custom;
{
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings =
      with monitor;
      import ./env.nix
      // import ./binds.nix lib
      // import ./general.nix theme
      // import ./animations.nix
      // import ./rules.nix lib theme
      // {
        monitor = "HDMI-A-1, ${toString width}x${toString height}@${toString hz}, 0x0, 1";
        exec-once = [
          "eww open mainbar; update-volume; update-mute; change-light-mode"
          "hyprctl dispatch movecursor ${toString (width / 2)} ${toString (height / 2)}"
        ];
      };
    extraConfig = import ./config.nix;
  };
}
