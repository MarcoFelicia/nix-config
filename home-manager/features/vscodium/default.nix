{
  lib,
  stable-pkgs,
  config,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = stable-pkgs.vscodium;
    userSettings = {
      "editor.tabSize" = 2;
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
      "terminal.integrated.defaultProfile.linux" = config.custom.defaultShellCommand;
      "git.confirmSync" = false;
      "workbench.startupEditor" = "none";
    };
    extensions = with stable-pkgs; [ vscode-extensions.jnoortheen.nix-ide ];
  };
}
