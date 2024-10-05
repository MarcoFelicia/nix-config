{
  customLib,
  config,
  username,
  ...
}:
with customLib;
{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  users = {
    users = {
      "${username}" = {
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        useDefaultShell = true;
      };
    };
  };
}
