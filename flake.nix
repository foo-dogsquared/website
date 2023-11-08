{
  description = "Very simple sample of a Nix flake with NixOS and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ config, lib, pkgs, ... }: {
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
        })
        ./hosts/desktop
      ];
    };
  };
}
