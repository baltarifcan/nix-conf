{
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.baltarifcan = {
    isNormalUser = true;
    description = "Arifcan";
    extraGroups = ["networkmanager" "wheel"];
  };
}
