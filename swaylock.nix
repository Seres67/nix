{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    swalock
  ];

  environment.etc."swaylock/config".text = ''
    image=/etc/sway/wallpaper.png
    scaling=fill
  '';
}
