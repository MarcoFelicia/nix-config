FLAKE=$1
shift

sudo nixos-rebuild switch --flake $NIX_CONFIG_HOME/#${FLAKE:-$NIX_HOSTNAME} ${@:-'--impure'}