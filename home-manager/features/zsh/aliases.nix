{
  to-nixos = "cd $NIX_CONFIG_HOME";
  nix-fmt = "$(to-nixos && nix fmt --quiet)";
  nix-clean = "sudo nix-collect-garbage -d && home-manager expire-generations $(date +%X)";
  nix-clean-boot-entries = "sudo /run/current-system/bin/switch-to-configuration boot";
  nix-update = "sudo nix flake update $NIX_CONFIG_HOME";
}
