{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    swaylock
  ];

  environment.etc."swaylock/config".text = ''
    image=/etc/nixos/assets/wallpaper.png
    scaling=fill
  '';
}
