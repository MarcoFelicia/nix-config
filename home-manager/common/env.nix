{ hostName, ... }:
{
  home.sessionVariables = {
    NIX_CONFIG_HOME = "$HOME/.config/nix-config";
    NIX_HOSTNAME = hostName;
  };
}
