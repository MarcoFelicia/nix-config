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
      path = ./features;
      extra = {
        firefox = {
          customCss = mkEnableOption "";
        };
        bat = {
          customTheme = mkEnableOption "";
        };
      };
    };
    scripts = mkOptionsForFiles { path = ./scripts; };

    defaultShellCommand = mkOption {
      type = types.str;
      default = "bash";
    };
  };

  config = mergeConfigs config.custom.features ./features args;
}
