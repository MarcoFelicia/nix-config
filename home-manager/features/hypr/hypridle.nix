{ ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 170;
          on-timeout = "idle-brightness";
          on-resume = "resume-brightness";
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
