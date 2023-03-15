{ config, options, lib, pkgs, ... }:

let
  cfg = config.home.mutableFiles;
  file = { config, name, ... }: {
  };
in
{
  options.home.mutableFile = lib.mkOption {
    type = with lib.types; attrsOf (submodule file);
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
