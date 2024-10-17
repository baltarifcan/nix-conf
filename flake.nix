{
  description = "baltarifcan's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    userName = "baltarifcan";
    hostName = "g15-nixos";
    userDesc = "Arifcan Balta";
    userEmail = "baltarifcan@gmail.com";
  in {
    nixosConfigurations.${hostName} = let
      params = {
        inherit hostName;
        inherit userName;
        inherit userDesc;
        inherit userEmail;
      };
    in
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          inherit params;
        };
        modules = [
          ./host
          ./user/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit params;
            };
            home-manager.users.${userName} = import ./user/home.nix;
          }
        ];
      };
  };
}
