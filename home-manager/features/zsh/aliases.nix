{
  reload = "source $ZDOTDIR/.zshrc";

  to-nixos = "cd $NIX_CONFIG_HOME";
  nix-fmt = "(to-nixos; nix fmt)";
  nix-clean = "nix-env --delete-generation old; sudo nix-collect-garbage -d";
  hm-clean = "home-manager expire-generations $(date +%X)";
  nix-clean-boot-entries = "sudo /run/current-system/bin/switch-to-configuration boot";
  nix-update = "sudo nix flake update $NIX_CONFIG_HOME";
}
