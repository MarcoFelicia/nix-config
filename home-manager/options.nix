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
    features = mkOptionsForFiles {
      inherit args;
      path = ./features;
    };
    scripts = mkOptionsForFiles { path = ./scripts; };

    defaultShellCommand = mkOption {
      type = types.str;
      default = "bash";
    };
  };

  config = mergeConfigs config.custom.features ./features args;
}
