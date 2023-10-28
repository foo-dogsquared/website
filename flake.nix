{
  description = "Basic flake template for setting up this project.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      systems = inputs.flake-utils.lib.defaultSystems;
      overlays = [ inputs.ruby-nix.overlays.ruby ];
    in
    inputs.flake-utils.lib.eachSystem systems (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShells.default = import ./shell.nix { inherit pkgs; };

        formatter = pkgs.treefmt;
      });
}
