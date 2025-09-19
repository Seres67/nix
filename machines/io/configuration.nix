{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "io";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services = {
    # xserver.xkb = {
    #   layout = "us";
    #   variant = "alt-intl";
    # };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig = {
        pipewire."92-low-latency" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 512;
            "default.clock.min-quantum" = 512;
            "default.clock.max-quantum" = 512;
          };
        };
        pipewire-pulse = {
          "91-discord-latency" = {
            pulse.rules = [
              {
                matches = [{"application.process.binary" = "Discord";}];
                actions = {
                  update-props = {
                    "pulse.min.quantum" = "1024/48000";
                  };
                };
              }
            ];
          };
          "92-low-latency" = {
            "context.properties" = [
              {
                name = "libpipewire-module-protocol-pulse";
                args = {};
              }
            ];
            "pulse.properties" = {
              "pulse.min.req" = "512/48000";
              "pulse.default.req" = "512/48000";
              "pulse.max.req" = "512/48000";
              "pulse.min.quantum" = "512/48000";
              "pulse.max.quantum" = "512/48000";
            };
            "stream.properties" = {
              "node.latency" = "256/48000";
              "resample.quality" = 1;
            };
          };
        };
      };
    };
  };

  console.keyMap = "us";

  security.rtkit.enable = true;

  users.users.seres = {
    isNormalUser = true;
    description = "seres";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "gamemode"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFomO3vJYFu3cQjt/7Q6PZ4jTcDBMi2Gsle4yxNUjOY seres@europa"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8l1rRqWELZXGI4cwWzUIju6b53krmf8l4gA/l08GsU seres@titan"
    ];
    packages = with pkgs; [
      moonlight-qt
      orca-slicer
      kdePackages.kate
      android-studio
      beeper
    ];
  };

  #TODO: get this out of here
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gparted
    btrfs-progs
    xdg-user-dirs
    pwvucontrol
    brightnessctl
  ];

  # KDE Connect ports
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];

  # Enable cross comp on io to aarch64
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
