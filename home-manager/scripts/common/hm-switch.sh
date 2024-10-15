FLAKE=$1
shift

home-manager switch --flake $NIX_CONFIG_HOME/#${FLAKE:-$NIX_HOSTNAME} $@