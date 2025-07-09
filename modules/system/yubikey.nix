{pkgs-yubico, ...}: {
  services.udev.packages = [pkgs-yubico.yubikey-personalization];

  # Smartcard
  services.pcscd.enable = true;

  # GPG and SSH
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs-yubico; [
    yubioath-flutter
    yubikey-personalization
  ];
}
