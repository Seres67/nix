{
  pkgs,
  pkgs-yubico,
  ...
}: {
  services.udev.packages = [pkgs.yubikey-personalization];

  # Smartcard
  services.pcscd.enable = true;

  # GPG and SSH
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    pkgs-yubico.yubioath-flutter
    yubikey-personalization
  ];
}
