{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  localGem = ruby-nix {
    name = "asciidoctor-foodogsquared-extensions";
    ruby = ruby_3_1;
    gemset = ./gemset.nix;
  };

  asciidoctorWrappedWithCustomOptions = writeShellScriptBin "asciidoctor" ''
    ${lib.getBin localGem.env}/bin/asciidoctor -T ./gems/templates $@
  '';

  treesitterWithPlugins = (tree-sitter.withPlugins (_: tree-sitter.allGrammars));
in
mkShell {
  buildInputs = [
    localGem.env
    localGem.ruby
  ];

  packages = [
    asciidoctorWrappedWithCustomOptions

    git
    libgit2
    go
    hugo
    gnuplot
    imagemagick
    openring

    tree-sitter
    treesitterWithPlugins

    netlify-cli # The deploy tool for this website.

    libffi
    libxslt

    # Formatters...
    nixpkgs-fmt # ...for Nix.
    nodePackages.prettier # ...for the web files.

    # Language servers...
    rnix-lsp # ...for Nix.
  ];

  shellHook = ''
    go version
    hugo version
    asciidoctor --version

    chmod u+x --recursive ./bin
  '';
}
