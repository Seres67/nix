{ pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  # Smartcard
  services.pcscd.enable = true;

  # GPG and SSH
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    yubioath-flutter
  ];
}
