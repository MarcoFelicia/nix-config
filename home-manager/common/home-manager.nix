{ username, ... }:
{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  # home.enableNixpkgsReleaseCheck = false;
  news.display = "silent";

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
