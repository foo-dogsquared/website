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
    };
  };
}
