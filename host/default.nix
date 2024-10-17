{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "g15-nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  system.stateVersion = "24.05";
}
