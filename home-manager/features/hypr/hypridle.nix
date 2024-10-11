{ ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 60;
          on-timeout = "exec idle-brightness";
          on-resume = "exec resume-brightness";
        }
        {
          timeout = 180;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
