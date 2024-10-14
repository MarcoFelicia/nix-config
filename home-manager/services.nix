{
  lib,
  pkgs,
  config,
  ...
}:
with builtins;
with lib;
let
  services = with pkgs; [
    rec {
      pkg = wl-gammarelay-rs;
      command = "${getExe pkg} run";
    }
    rec {
      pkg = eww;
      command = "${getExe pkg} daemon";
    }
  ];
in
{
  systemd.user.services = listToAttrs (
    map (
      { pkg, command }:
      let
        serviceName = pkg.pname or pkg.name;
      in
      {
        name = "custom-" + serviceName;
        value = {
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };

          Unit = {
            ConditionEnvironment = "WAYLAND_DISPLAY";
            After = [ "graphical-session.target" ];
          };

          Service = {
            ExecStart = command;
            Restart = "always";
            RestartSec = "10";
          };
        };
      }
    ) (filter (service: elem service.pkg config.home.packages) services)
  );
}
