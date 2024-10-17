{
  config,
  lib,
  pkgs,
  inputs,
  params,
  ...
}: {
  imports = [
    ./modules/vt.nix
    ./modules/system.nix
    ./modules/font.nix
    ./modules/locale.nix
    ./modules/nix.nix
    ./modules/sound.nix
    ./modules/system.nix
    ./modules/display.nix
    ./modules/packages.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = params.hostName;
  networking.networkmanager.enable = true;

  system.stateVersion = "24.05";
}
