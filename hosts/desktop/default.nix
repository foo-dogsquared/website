{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/".label = "root";
  fileSystems."/boot".label = "boot";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.05";

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    initialHashedPassword = "";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
