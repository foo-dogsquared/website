{ config, lib, pkgs, ... }:

let
  musicDir = config.xdg.userDirs.music;
  playlistsDir = "${musicDir}/playlists";
in
{
  # My music player setup, completely configured with Nix!
  programs.beets = {
    enable = true;
    settings = {
      library = "${musicDir}/library.db";
      plugins = [
        "acousticbrainz"
        "chroma"
        "edit"
        "export"
        "fetchart"
        "fromfilename"
        "fuzzy"
        "mbsync"
        "playlist"
        "scrub"
        "smartplaylist"
      ];
      ignore_hidden = true;
      directory = musicDir;
      ui.color = true;

      import = {
        move = true;
        link = false;
        resume = true;
        incremental = true;
        group_albums = true;
        log = "beets.log";
      };

      match.ignore_video_tracks = true;

      # Plugins configuration.
      fuzzy.prefix = "-";
      scrub.auto = true;
      smartplaylist = {
        relative_to = musicDir;
        playlist_dir = playlistsDir;
        playlists = [
          {
            name = "all.m3u8";
            query = "";
          }
          {
            name = "released-in-$year.m3u8";
            query = "year:2000..2023";
          }
        ];
      };
    };
  };

  home.stateVersion = "23.05";
}
