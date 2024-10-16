{
  pkgs,
  lib,
  config,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };
  nix.settings.trusted-users = [username];
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    builders-use-substitutes = true;
  };
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };
  services.printing.enable = true;

  fonts = {
    packages = with pkgs; [
      material-design-icons
      noto-fonts
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];
    enableDefaultPackages = false;

    fontConfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
  programs.hyprland.enable = true;
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
  ];
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.power-profiles-daemon.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings=true;
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
