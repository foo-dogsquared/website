{
  description = "Basic flake template for setting up this project.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let systems = inputs.flake-utils.lib.defaultSystems;
    in inputs.flake-utils.lib.eachSystem systems (system:
      let pkgs = import nixpkgs { inherit system; };
    in {
      devShell =
        import ./nix/shell.nix { inherit pkgs; };
    });
}
