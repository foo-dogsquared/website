{ config, lib, pkgs, ... }:

let
  inherit (config.networking) domain;
  domainZoneFile = ./config/coredns/${domain}.zone;
  domainZoneFile' = "/etc/coredns/zones/${domain}.zone";

  dnsDomainName = "ns1.${domain}";
  corednsServiceName = "coredns";
in
{
  # Generating a certificate for the DNS-over-TLS feature.
  security.acme.certs."${dnsDomainName}".postRun = ''
    systemctl restart ${corednsServiceName}.service
  '';

  services.coredns.config = ''
    tls://. {
      tls {$CREDENTIALS_DIRECTORY}/cert.pem {$CREDENTIALS_DIRECTORY}/key.pem {$CREDENTIALS_DIRECTORY}/fullchain.pem
      forward . /etc/resolv.conf
    }
  '';

  systemd.services.${corednsServiceName} = {
    requires = [ "acme-finished-${dnsDomainName}.target" ];
    preStart =
      let
        secretsPath = path: config.sops.secrets."plover/${path}".path;
        replaceSecretBin = "${lib.getBin pkgs.replace-secret}/bin/replace-secret";
      in
      lib.mkBefore ''
        install -Dm0644 ${domainZoneFile} ${domainZoneFile'}

        ${replaceSecretBin} '#mailboxSecurityKey#' '${secretsPath "dns/${domain}/mailbox-security-key"}' '${domainZoneFile'}'
        ${replaceSecretBin} '#mailboxSecurityKeyRecord#' '${secretsPath "dns/${domain}/mailbox-security-key-record"}' '${domainZoneFile'}'
      '';
    serviceConfig.LoadCredential = let
      certDirectory = config.security.acme.certs."${dnsDomainName}".directory;
    in
    [
      "cert.pem:${certDirectory}/cert.pem"
      "key.pem:${certDirectory}/key.pem"
      "fullchain.pem:${certDirectory}/fullchain.pem"
    ];
  };
}
