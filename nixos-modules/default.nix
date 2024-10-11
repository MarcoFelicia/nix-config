{
  config,
  customLib,
  features,
  ...
}:
with customLib;
{
  imports = bundleModules ./.;

  custom.features = enableOptions (filterNonExistingOption config.custom.features features);
}
