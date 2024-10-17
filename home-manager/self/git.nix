{ ... }:
{
  programs.git = {
    enable = true;
    userName = "3b4d80a2-0c72-4839-8000-c72d4daf561f";
    userEmail = "3b4d80a2-0c72-4839-8000-c72d4daf561f";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
