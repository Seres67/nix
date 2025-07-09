{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    swaylock
  ];

  environment.etc."swaylock/config".text = ''
    scaling=fill
  '';
}
