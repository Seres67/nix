{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    swaylock
  ];

  environment.etc."swaylock/config".text = ''
    image=/etc/nixos/wallpaper.png
    scaling=fill
  '';
}
