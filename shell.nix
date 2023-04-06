{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  packages = [
    asciidoctor
    git
    go
    hugo
  ];
}
