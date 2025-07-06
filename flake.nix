{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-yubico.url = "github:NixOS/nixpkgs/nixos-25.05";
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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-yubico,
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
      pkgs-yubico = import nixpkgs-yubico {
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations.nessus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./modules/system/stylix.nix
          (import ./machines/nessus/hardware.nix { inherit nixos-hardware; })
          ./modules/system/zram.nix
          ./machines/nessus/configuration.nix
          (import ./modules/system/yubikey.nix { inherit pkgs pkgs-yubico; })
          ./modules/system/firacode-nerd.nix
          ./modules/system/touchpad.nix
          ./modules/system/gc.nix
          ./modules/desktop/greetd.nix
          ./modules/system/xdg-portal.nix
          ./modules/desktop/hyprland.nix
          ./modules/desktop/wofi.nix
          ./modules/apps/kitty.nix
          ./modules/apps/steam.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.seres = import ./home/seres/default.nix;
            home-manager.backupFileExtension = "hmbak";
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
          {
            environment.systemPackages = with pkgs; [
              nvim-pkg
              inputs.zen-browser.packages."${system}".beta
            ];
          }
        ];
      };
    };
}
