{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager-unstable.url = "github:nix-community/home-manager";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      home-manager-unstable,
      flake-utils,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      customLib = import ./custom-lib { inherit inputs; };
    in
    with builtins;
    with customLib;
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    }
    // (
      let
        nixosModules = import ./nixos-modules;
        homeManagerModules = import ./home-manager;
        hostsDir = ./hosts;

        mkHost =
          params:
          with params;
          (if stable then nixpkgs else nixpkgs-unstable).lib.nixosSystem {
            pkgs = getPkgs system stable;
            specialArgs = {
              inherit inputs customLib;
            } // params;
            modules = [
              configPath
              nixosModules
            ];
          };
        mkHomeManager =
          params:
          with params;
          (if stable then home-manager else home-manager-unstable).lib.homeManagerConfiguration {
            pkgs = getPkgs system stable;
            extraSpecialArgs = {
              inherit inputs customLib hostName;
              stable-pkgs = getPkgs system true;
            } // params;
            modules = [
              configPath
              homeManagerModules
            ];
          };
        genConfiguration =
          path: type:
          assert builtins.match "home-configuration|configuration" type != null;
          builtins.listToAttrs (
            map (
              hostPath:
              let
                hostName = customLib.subDirName hostPath;
                value = (if type == "home-configuration" then mkHomeManager else mkHost) (
                  {
                    inherit hostName;
                    configPath = hostPath + "/${type}.nix";
                  }
                  // import (hostPath + "/params.nix")
                );
              in
              {
                inherit value;
                name = hostName;
              }
            ) (customLib.dirsIn path)
          );
      in
      {
        nixosConfigurations = genConfiguration hostsDir "configuration";
        homeConfigurations = genConfiguration hostsDir "home-configuration";
      }
    )
    // (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.qemu = pkgs.mkShell {
          packages = with pkgs; [ qemu ];
          shellHook = ''
            cd ~/Documents
          '';
        };
      }
    ));
}
