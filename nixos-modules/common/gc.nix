{ ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
}
