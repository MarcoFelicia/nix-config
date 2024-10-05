{
  config,
  customLib,
  features,
  ...
}:
with customLib;
{
  imports = [ ./options.nix ] ++ (filesIn ./common);

  custom.features = enableOptions (filterNonExistingOption config.custom.features features);
}
