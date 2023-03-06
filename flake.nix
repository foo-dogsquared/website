{
  description = "Basic flake template for setting up this project.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    ruby-nix.url = "github:sagittaros/ruby-nix";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      systems = inputs.flake-utils.lib.defaultSystems;
      overlays = [ inputs.ruby-nix.overlays.ruby ];
    in
    inputs.flake-utils.lib.eachSystem systems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = overlays ++ [
            (final: prev: {
              ruby-nix = inputs.ruby-nix.lib prev;
            })
          ];
        };
      in
      {
        devShells.default = import ./shell.nix { inherit pkgs; };

        formatter = pkgs.treefmt;
      });
}
