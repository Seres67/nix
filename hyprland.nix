{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.clipboard-sync.enable = true;
}
