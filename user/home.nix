{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  program.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
  home.username = "baltarifcan";
  home.homeDirectory = "/home/baltarifcan";
  home.packages = with pkgs; [
    nix-output-monitor
    zip
    unzip
    p7zip
    ripgrep
    htop
    libnotify
    xdg-utils
    insomnia
    obsidian
  ];
  programs.git = {
    userName = "baltarifcan";
    userEmail = "baltarifcan@gmail.com";
  };
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs = {
    firefox = {
      enable = true;
      profiles.baltarifcan = {};
    };
  };
}
