{
  pkgs,
  lib,
  config,
  ...
}: {
  services.printing.enable = true;

  programs.hyprland.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "baltarifcan";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    curl
    git
    sysstat
    lm_sensors
    xfce.thunar
    neofetch
    vscodium
  ];

  security.rtkit.enable = true;
  services.power-profiles-daemon.enable = true;

  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  services = {
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;

    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };
}
