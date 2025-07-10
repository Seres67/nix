{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  networking = {
    hostName = "titan";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "alt-intl";
    };
  };

  console.keyMap = "us";

  users.users.seres = {
    isNormalUser = true;
    description = "seres";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFomO3vJYFu3cQjt/7Q6PZ4jTcDBMi2Gsle4yxNUjOY seres@europa"
    ];
  };

  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      hostName = "builder";
      systems = ["x86_64-linux" "aarch64-linux"];
      maxJobs = 4;
      speedFactor = 2;
      supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
    }
  ];
  programs.ssh.extraConfig = ''
    Host builder
      HostName 192.168.1.25
      Port 22
      User seres
      IdentitiesOnly yes
      IdentityFile /root/.ssh/id_ed25519
  '';
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    xdg-user-dirs
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
