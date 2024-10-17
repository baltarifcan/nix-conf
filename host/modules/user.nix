{
  pkgs,
  lib,
  config,
  params,
  ...
}: {
  users.users.${params.userName} = {
    isNormalUser = true;
    description = params.userDesc;
    extraGroups = ["networkmanager" "wheel"];
  };
}
