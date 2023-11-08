{
  description = "Very simple sample of a Nix flake with NixOS and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
    nixSettings = { config, lib, pkgs, ... }: {
      # Setting each of the flake inputs as part of the system registry
      # including our own flake which is just renamed from "self" to
      # "config".
      nix.registry =
        lib.mapAttrs'
          (name: flake:
            let
              name' = if (name == "self") then "config" else name;
            in
            lib.nameValuePair name' { inherit flake; })
          inputs;
    };
  in
  {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixSettings
        ./hosts/desktop
      ];
    };

    homeConfigurations.foodogsquared = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        nixSettings
        ./users/foodogsquared
      ];
    };
  };
}
