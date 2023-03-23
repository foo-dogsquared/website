{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  localGem = ruby-nix {
    name = "asciidoctor-foodogsquared-extensions";
    ruby = ruby_3_1;
    gemset = ./gemset.nix;
  };
in
mkShell {
  buildInputs = [
    localGem.env
    localGem.ruby
  ];

  packages = [
    git
    go
    hugo
    jq
    openring
    gnumake
    tree-sitter

    # Formatters...
    rufo # ...for Ruby.
    nixpkgs-fmt # ...for Nix.
    nodePackages.prettier # ...for the web files.

    # Language servers...
    rnix-lsp # ...for Nix.

    libxslt
  ];

  shellHook = ''
    go version
    hugo version
    asciidoctor --version

    chmod u+x --recursive ./bin
  '';
}
