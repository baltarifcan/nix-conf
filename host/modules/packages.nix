{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kitty
    wget
    curl
    sysstat
    lm_sensors
    neofetch
    nushell
  ];
}
