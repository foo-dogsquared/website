{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  packages = [
    curl
    cacert
    asciidoctor
    entr
    git
    go
    hugo
    jq
    openring
    gnumake
  ];

  shellHook = ''
    go version
    hugo version
    asciidoctor --version
  '';
}
