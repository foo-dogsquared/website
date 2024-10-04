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
    # To build my website.
    asciidoctorWrappedWithCustomOptions
    bundix
    gems
    gems.wrappedRuby
    netlify-cli
    git
    libgit2
    go
    hugo
    gnuplot
    imagemagick
    inkscape
    openring
    tree-sitter
    treesitterWithPlugins

    # To build my resume.
    typst

    libffi
    libxslt

    # Formatters...
    nixpkgs-fmt # ...for Nix.
    nodePackages.prettier # ...for the web files.
  ];

  shellHook = ''
    go version
    hugo version
    which asciidoctor
    asciidoctor --version

    chmod u+x --recursive ./bin
  '';
}
