{
  pkgs,
  lib,
  config,
  ...
}: {
  programs = {
    zsh.enable = true;
    neovim.enable = true;
    neovim.defaultEditor = true;
    git.enable = true;
    git.lfs.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    htop.enable = true;
    hyprland.enable = true;
    dconf.enable = true;
    thunar.enable = true;
    nm-applet.enable = true;
    coolercontrol.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
