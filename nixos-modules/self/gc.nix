{ ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 1d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
}
