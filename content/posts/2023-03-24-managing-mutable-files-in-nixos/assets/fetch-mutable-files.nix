{ config, options, lib, pkgs, ... }:

let
  cfg = config.home.mutableFiles;
  file = baseDir: { config, name, ... }: {
    options = {
      url = lib.mkOption {
        type = lib.types.str;
        description = lib.mkDoc ''
          The URL of the file to be fetched.
        '';
        example = "https://github.com/foo-dogsquared/dotfiles.git";
      };

      path = lib.mkOption {
        type = lib.types.str;
        description = lib.mkDoc ''
          Output path of the resource relative to ${baseDir}.
        '';
        default = name;
        apply = p:
          if lib.hasPrefix "/" p then p else "${baseDir}/${p}";
      };

      type = lib.mkOption {
        type = lib.types.enum [ "git" "fetch" ];
        description = lib.mkDoc ''
          Type that configures the behavior for fetching the URL.

          This accept only certain keywords.

          - For `fetch`, the file will be fetched with `curl`.
          - For `git`, it will be fetched with `git clone`.

          The default type is `fetch`.
        '';
        default = "fetch";
        example = "git";
      };
    };
  };
in
{
  options.home.mutableFile = lib.mkOption {
    type = with lib.types; attrsOf (submodule (file config.home.homeDirectory));
    default = { };
    description = lib.mkDoc ''
      An attribute set of mutable files and directories to be fetched into the
      home directory.
    '';
    example = lib.literalExpression ''
      "''${config.xdg.userDirs.documents}/dotfiles" = {
        url = "https://github.com/foo-dogsquared/dotfiles.git";
        type = "git";
      };

      "''${config.xdg.userDirs.documents}/top-secret" = {
        url = "https://example.com/file.zip";
        type = "fetch";
      };
    '';
  };

  config = {
    systemd.user.services.fetch-mutable-files = {
      Unit = {
        Description = "Fetch mutable files from home-manager";
        After = [ "default.target" "network-online.target" ];
        Wants = [ "network-online.target" ];
      };

      Service = {
        # We'll assume this service will download lots of files. We want the
        # temporary files to only last along with the service.
        PrivateUsers = true;
        PrivateTmp = true;

        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart =
          let
            curl = "${lib.getBin pkgs.curl}/bin/curl";
            git = "${lib.getBin pkgs.curl}/bin/git";
            fetchCmds = lib.mapAttrsToList
              (file: value:
                let
                  inherit (value) type;
                  path = lib.escapeShellArg value.path;
                  url = lib.escapeURL value.url;
                in
                ''
                  ${lib.optionalString (type == "git") "[ -d ${path} ] || ${git} clone ${url} ${path}"}
                  ${lib.optionalString (type == "fetch") "[ -d ${path} ] || ${curl} ${url} --output ${path}"}
                '')
              cfg;
            shellScript = pkgs.writeShellScript "fetch-mutable-files" ''
              ${lib.concatStringsSep "\n" fetchCmds}
            '';
          in
          builtins.toString shellScript;
      };

      Install.WantedBy = [ "default.target" ];
    };
  };
}
