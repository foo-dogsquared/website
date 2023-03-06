{ config, lib, pkgs, ... }:

let
  giteaDatabaseUser = "gitea";
in
{
  systemd.services.gitea = {
    # Gitea service module will have to set up certain things first which is
    # why we have to go first.
    preStart =
      let
        psqlBin = "${lib.getBin config.services.postgresql.package}/bin/psql";
        giteaBin = "${lib.getBin config.services.gitea.package}/bin/gitea";
        giteaAdminUsername = lib.escapeShellArg "foodogsquared";
      in
      lib.mkMerge [
        (lib.mkBefore ''
          # Setting up the appropriate schema for PostgreSQL secure schema usage.
          ${psqlBin} -tAc "SELECT 1 FROM information_schema.schemata WHERE schema_name='${giteaDatabaseUser}';" \
            grep -q 1 || ${psqlBin} -tAc "CREATE SCHEMA IF NOT EXISTS AUTHORIZATION ${giteaDatabaseUser};"
        '')

        (lib.mkAfter ''
          # Setting up the administrator account automated.
          ${giteaBin} admin user list --admin | grep -q ${giteaAdminUsername} \
            || ${giteaBin} admin user create \
              --username ${giteaAdminUsername} --email foodogsquared@${config.networking.domain} \
              --random-password --random-password-length 76 --admin
        '')
      ];
  };
}
