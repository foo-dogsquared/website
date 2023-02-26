{ config, options, lib, pkgs, ... }:

let
  # IPv4 is already configured through DHCP so no need to configure it.
  wan = {
    IPv6.address = "2001:db8:4723:d1ad::";
    IPv6.gateway = "fe80::1";
  };

  lan = {
    IPv4.address = "10.32.54.1";
    IPv4.gateway = "10.0.0.1";
    IPv6.address = "fd45:5643:1ade::";
    IPv6.gateway = "fe80::1";
  };
in
{
  systemd.network.networks = {
    "10-wan" = with wan; {
      matchConfig.Name = [ "ens3" "enp0s3" ];

      # Setting up IPv6.
      address = [ "${IPv6.address}/64" ];
      gateway = [ IPv6.gateway ];

      networkConfig = {
        # IPv6 has to be manually configured.
        DHCP = "ipv4";

        LinkLocalAddressing = "ipv6";
        IPForward = true;

        # This is based from
        # https://docs.hetzner.com/dns-console/dns/general/recursive-name-servers/.
        DNS = [
          "2a01:4ff:ff00::add:2"
          "2a01:4ff:ff00::add:1"
        ];
      };
    };

    "20-lan" = with lan; {
      matchConfig.Name = [ "ens10" "enp0s10" ];

      address = [
        "${IPv4.address}/16"
        "${IPv6.address}/64"
      ];

      gateway = [
        IPv4.gateway
        IPv6.gateway
      ];
    };
  };
}
