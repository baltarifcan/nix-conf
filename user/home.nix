{
  inputs,
  params,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.username = params.userName;
  home.homeDirectory = "/home/${params.userName}";
  services.mako.enable = true;
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;
  services.poweralertd.enable = true;
  services.copyq.enable = true;
  services.flameshot.enable = true;
  services.hyprpaper.enable = true;
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };
  programs = {
    mpv.enable = true;

    rofi.enable = true;
    tmux.enable = true;
    helix.enable = true;
    nushell.enable = true;
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
    hyprpicker
    fractal
    webcord
    libnotify
    xdg-utils
    insomnia
    obsidian
  ];

  home.stateVersion = "24.05";
}
