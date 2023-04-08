{
  description = "Basic flake template for setting up development shells";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    ruby-nix.url = "github:sagittaros/ruby-nix";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let systems = inputs.flake-utils.lib.defaultSystems;
    in inputs.flake-utils.lib.eachSystem systems (system: {
      devShells.default = let
          pkgs = import nixpkgs { inherit system; };
      in
        import ./shell.nix {
          inherit pkgs;
          ruby-nix = inputs.ruby-nix.lib pkgs;
        };
    });
}
