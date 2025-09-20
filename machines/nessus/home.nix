{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../home/seres/default.nix
    ../../home/seres/gtk.nix
    ../../home/seres/hyprland.nix
    ../../home/seres/waybar.nix
    ../../home/seres/mako.nix
    ../../home/seres/kitty.nix
    inputs.nvf.homeManagerModules.default
    (import ../../home/seres/neovim.nix {inherit pkgs;})
    ../../home/seres/vesktop.nix
    ../../home/seres/kde-connect.nix
    ../../home/seres/mime.nix
    ../../home/seres/easyeffects.nix
    ../../home/seres/obsidian.nix
  ];
  programs = {
    hyprlock.enable = true;
    wofi.enable = true;
  };
}
