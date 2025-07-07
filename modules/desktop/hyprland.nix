{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    hyprpicker
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
