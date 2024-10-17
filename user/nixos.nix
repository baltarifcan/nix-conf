{
  pkgs,
  lib,
  config,
  params,
  ...
}: {
  users.users.${params.userName} = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = params.userDesc;
    extraGroups = ["networkmanager" "wheel"];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = params.userName;
      };
    };
  };
}
