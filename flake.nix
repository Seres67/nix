{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-yubico.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-yubico,
    nixos-hardware,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    pkgs-yubico = import nixpkgs-yubico {
      inherit system;
    };
  in {
    nixosConfigurations = {
      nessus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./modules/system/stylix.nix
          (import ./machines/nessus/hardware.nix {inherit nixos-hardware;})
          ./modules/system/zram.nix
          ./machines/nessus/configuration.nix
          (import ./modules/system/yubikey.nix {inherit pkgs-yubico;})
          ./modules/system/firacode-nerd.nix
          ./modules/system/touchpad.nix
          ./modules/system/gc.nix
          ./modules/desktop/greetd.nix
          ./modules/system/xdg-portal.nix
          ./modules/services/waydroid.nix
          ./modules/desktop/xfce.nix
          ./modules/desktop/hyprland.nix
          ./modules/desktop/wofi.nix
          ./modules/apps/steam.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.seres = import ./home/seres/default.nix;
              backupFileExtension = "hmbak2";
              extraSpecialArgs = {inherit inputs;};
            };
          }
          {
            environment.systemPackages = with pkgs; [
              inputs.zen-browser.packages."${system}".beta
            ];
          }
        ];
      };
      io = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          ./modules/system/stylix.nix
          (import ./machines/io/hardware.nix {inherit nixos-hardware;})
          ./modules/system/zram.nix
          ./machines/io/configuration.nix
          (import ./modules/system/yubikey.nix {inherit pkgs-yubico;})
          ./modules/system/firacode-nerd.nix
          ./modules/system/gc.nix
          ./modules/desktop/greetd.nix
          ./modules/system/xdg-portal.nix
          ./modules/services/waydroid.nix
          ./modules/desktop/xfce.nix
          ./modules/desktop/hyprland.nix
          ./modules/desktop/wofi.nix
          ./modules/apps/steam.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.seres = import ./home/seres/default.nix;
              backupFileExtension = "hmbak2";
              extraSpecialArgs = {inherit inputs;};
            };
          }
          {
            environment.systemPackages = with pkgs; [
              inputs.zen-browser.packages."${system}".beta
            ];
          }
        ];
      };
      titan = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./modules/system/zram.nix
          ./machines/titan/configuration.nix
          ./modules/system/gc.nix
          ./modules/services/openssh.nix
        ];
      };
    };
  };
}
