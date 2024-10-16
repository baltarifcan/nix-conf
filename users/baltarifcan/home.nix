{ config, pkgs, ... }:

{
  home.username = "baltarifcan";
  home.homeDirectory = "/home/baltarifcan";
  home.packages = with pkgs; [
    nix-output-monitor
 ];
 programs.git = {
  enable = true;
  userName = "baltarifcan";
  userEmail = "baltarifcan@gmail.com";  
 };
 home.stateVersion = "24.05";
 programs.home-manager.enable = true;

}
