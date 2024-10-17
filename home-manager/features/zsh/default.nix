{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  programs.zsh = {
    enable = true;
    dotDir = ".zsh";
    history = {
      save = 1000;
      size = 1000;
      ignorePatterns = [
        "gen-passwd*"
        "get-passwd*"
        "gpg *"
        "pass *"
      ];
    };
    completionInit = import ./completion.nix;
    initExtra = import ./config.nix lib config + import ./keybinds.nix lib;
    shellAliases = import ./aliases.nix;

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
  };
}
