{
  config,
  customLib,
  features,
  ...
}:
with customLib;
{
  imports = [ ./options.nix ] ++ (allIn ./self);

  custom.features = enableOptions (filterNonExistingOption config.custom.features features);
}
