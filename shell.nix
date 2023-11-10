{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  gems = bundlerEnv {
    name = "foodogsquared-blog-gems";
    ruby = ruby_3_1;
    gemdir = ./.;
  };

  asciidoctorWrappedWithCustomOptions = writeShellScriptBin "asciidoctor" ''
    ${lib.getBin gems}/bin/asciidoctor -T ${./templates} $@
  '';

  treesitterWithPlugins = (tree-sitter.withPlugins (_: tree-sitter.allGrammars));
in
mkShell {
  packages = [
    asciidoctorWrappedWithCustomOptions
    bundix
    gems
    gems.wrappedRuby

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
    which asciidoctor
    asciidoctor --version

    chmod u+x --recursive ./bin
  '';
}
