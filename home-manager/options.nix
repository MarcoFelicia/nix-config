{
  pkgs,
  lib,
  customLib,
  config,
  ...
}@args:
with customLib;
with lib;
{
  options.custom = {
    features = mkOptionsForFiles ./features;
    scripts = mkOptionsForFiles ./scripts;
    defaultShellCommand = mkOption {
      type = types.str;
      default = "bash";
    };
  };

  config = mergeConfigs config.custom.features ./features args;
}
