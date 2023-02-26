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
  networking = {
    enableIPv6 = true;
    defaultGatewayIPv6 = wan.IPv6.gateway;

    interfaces = {
      enp0s3 = {
        useDHCP = true;
        ipv6.addresses = [
          {
            address = wan.IPv6.address;
            prefixLength = 64;
          }
        ];
      };

      enp0s10 = {
        ipv4.addresses = [
          {
            address = lan.IPv4.address;
            prefixLength = 16;
          }
        ];

        ipv6.addresses = [
          {
            address = lan.IPv6.address;
            prefixLength = 64;
          }
        ];
      };
    };
  };
}
