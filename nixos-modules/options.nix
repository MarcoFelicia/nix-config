{
  pkgs,
  customLib,
  config,
  ...
}@args:
with customLib;
{
  options.custom = {
    features = mkOptionsForFiles { path = ./features; };
  };

  config = mergeConfigs config.custom.features ./features args;
}
