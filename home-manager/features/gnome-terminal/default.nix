{ config, ... }:
{
  programs.gnome-terminal = {
    enable = true;
    profile."89d5c0e4-9243-4fe3-a8ff-c2a046fc3b41" = {
      default = true;
      visibleName = "Default";
      font = "Monospace 12";
      allowBold = true;
      audibleBell = false;
      customCommand = config.custom.defaultShellCommand;
    };
  };
}
