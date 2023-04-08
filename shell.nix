{ pkgs ? import <nixpkgs> { }, ruby-nix }:

with pkgs;

let
  localGems = ruby-nix {
    name = "hugo-website-gems";
    gemset = ./gemset.nix;
  };
in
mkShell {
  buildInputs = [
    localGems.env
    localGems.ruby
  ];

  packages = [
    git
    go
    hugo
  ];
}
