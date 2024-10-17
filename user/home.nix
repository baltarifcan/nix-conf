{
  inputs,
  params,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.username = params.userName;
  home.homeDirectory = "/home/${params.userName}";

  programs = {
    home-manager.enable = true;
    ags = {
      enable = true;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
    firefox = {
      enable = true;
      profiles.${params.userName} = {};
    };
    git = {
      enable = true;
      userName = params.userName;
      userEmail = params.userEmail;
    };
    kitty = {
      enable = true;
      theme = "Catppuccin-Frappe";
      font.name = "JetBrainsMono Nerd Font";
      font.size = 13;
      settings.background_opacity = 0.9;
      settings.shell = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };

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

  home.stateVersion = "24.05";
}
