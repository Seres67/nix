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
    image=/etc/sway/wallpaper.png
    scaling=fill
  '';
}
