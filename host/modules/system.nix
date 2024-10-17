{
  pkgs,
  lib,
  config,
  params,
  ...
}: {
  security.rtkit.enable = true;

  services = {
    upower.enable = true;
    printing.enable = true;

    blueman.enable = true;
    power-profiles-daemon.enable = true;
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;

    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };
}
