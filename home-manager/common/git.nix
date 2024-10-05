{ ... }:
{
  programs.git = {
    enable = true;
    userName = "MarcoFelicia";
    userEmail = "MarcoFelicia@email.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
