{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  gems = bundlerEnv {
    name = "hugo-website-gems";
    gemdir = ./.;
  };
in
mkShell {
  packages = [
    gems
    gems.wrappedRuby

    git
    go
    hugo
  ];
}
