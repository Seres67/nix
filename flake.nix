{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kickstart-nix.url = "github:Seres67/kickstart-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      stylix,
      kickstart-nix,
      ...
    }@inputs:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ kickstart-nix.overlays.default ];
      };
    in
    {
      nixosConfigurations.nessus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./stylix.nix
          (import ./hardware/nessus.nix { inherit nixos-hardware; })
          ./zram.nix
          ./configuration.nix
          ./firacode-nerd.nix
          ./touchpad.nix
          ./gc.nix
          ./sway.nix
          ./swaylock.nix
          ./waybar.nix
          ./wofi.nix
          ./kitty.nix
          ./steam.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.seres = import ./home.nix;
            home-manager.backupFileExtension = "hmbak";
          }
          {
            environment.systemPackages = with pkgs; [
              nvim-pkg
            ];
          }
        ];
      };
    };
}
