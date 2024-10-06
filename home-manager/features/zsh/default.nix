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
    history = {
      save = 1000;
      size = 1000;
      extended = false;
    };
    shellAliases = import ./aliases.nix;
    initExtra = import ./config.nix + import ./keybinds.nix;

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };
}
