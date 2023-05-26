{ config, lib, pkgs, ... }:

let
  musicDir = "/srv/music";
  playlistsDir = "${musicDir}/playlists";
in
{
  services.mopidy = {
    enable = true;
    extensionPackages = with pkgs; [
      mopidy-iris
      mopidy-local
      mopidy-mpd
      mopidy-mpris
      mopidy-youtube
    ];

    configuration = ''
      [http]
      hostname = 172.23.0.1
      port = 6669

      [file]
      enabled = true
      media_dirs =
        ${musicDir}|Music

      [m3u]
      enabled = true
      base_dir = ${musicDir}
      playlists_dir = ${playlistsDir}
      default_encoding = utf-8
      default_extension = .m3u8
    '';
  };

  services.gonic = {
    enable = true;
    settings = {
      listen-addr = "172.23.0.1:4747";
      cache-path = "/var/cache/gonic";
      music-path = [ musicDir ];
      podcast-path = "/var/cache/gonic/podcasts";

      jukebox-enabled = true;

      scan-interval = 1;
      scan-at-start-enabled = true;
    };
  };

  system.stateVersion = "23.05";
}
