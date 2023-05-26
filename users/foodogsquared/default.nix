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

  services.mopidy = {
    enable = true;
    extensionPackages = with pkgs; [
      mopidy-beets
      mopidy-funkwhale
      mopidy-internetarchive
      mopidy-iris
      mopidy-local
      mopidy-mpd
      mopidy-mpris
      mopidy-youtube
    ];

    settings = {
      http = {
        hostname = "0.0.0.0";
      };

      file = {
        enabled = true;
        media_dirs = [
          "$XDG_MUSIC_DIR|Music"
          "~/library/music|Library"
        ];
      };

      internetarchive = {
        enabled = true;
        browse_limit = 150;
        search_limit = 150;
        collections = [
          "fav-foo-dogsquared"
          "audio"
          "etree"
          "audio_music"
          "audio_foreign"
        ];
      };

      m3u = {
        enabled = true;
        base_dir = musicDir;
        playlists_dir = playlistsDir;
        default_encoding = "utf-8";
        default_extension = ".m3u8";
      };
    };
  };

  systemd.user.services.gonic = {
    Unit = {
      After = [ "network.target" "sound.target" ];
      Description = "Gonic server";
      Documentation = [ "https://github.com/sentriz/gonic" ];
    };

    Service.ExecStart = "${lib.getBin pkgs.gonic}/bin/gonic -config-path %E/gonic/gonic.conf -music-path %h/Music -cache-path %C/gonic -podcast-path %C/gonic/podcasts";
    Install.WantedBy = "default.target";
  };

  home.stateVersion = "23.05";
}
