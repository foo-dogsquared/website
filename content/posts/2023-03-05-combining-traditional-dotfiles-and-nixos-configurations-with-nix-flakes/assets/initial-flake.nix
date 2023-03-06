{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      modules = [
        # The NixOS configuration.
        ./configuration.nix
      ];
    };

    homeConfigurations.foodogsquared = home-manager.lib.homeManagerConfiguration {
      # The home-manager configuration.
      modules = [ ./home.nix ];
    };
  };
}
