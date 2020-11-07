let
  # See https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs for more information on pinning
  nixpkgs = builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixpkgs-unstable-2020-11-07";
    # Commit hash for nixos-unstable as of 2019-02-26
    url = https://github.com/NixOS/nixpkgs/archive/c54c614000644ecf9b8f8e9c873cfa91d1c05bf1.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "19xmsj1dhq25arhsfx0sl3r1y0zgpzfwhybc5dsxr1szh71wz3xs";
  };
in
{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  openring = buildGoModule rec {
    pname = "openring";
    version = "af9038b5";

    src = fetchgit {
      url = "https://git.sr.ht/~sircmpwn/openring";
      rev = "af9038b5bbf8d0bac9f401ccab263990df900dab";
      sha256 = "1r8vnqbsrjrafva12v5cbv4229qsx7z5lp19zhqzky9chais4c9k";
    };

    vendorSha256 = "sha256-BbBTmkGyLrIWphXC+dBaHaVzHuXRZ+4N/Jt2k3nF7Z4=";

    subPackages = [ "." ];

    meta = with stdenv.lib; {
      description = "Tool for generating a webring from a list of RSS feeds.";
      homepage = "https://git.sr.ht/~sircmpwn/openring";
      license = licenses.gpl3;
    };
  };
in
mkShell {
  buildInputs = [
    asciidoctor
    git
    go
    hugo
    jq
    openring
  ];

  shellHook = ''
    chmod +x ./bin/openring-create
    go version
    hugo version
  '';
}
