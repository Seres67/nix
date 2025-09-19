{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "seres";
    homeDirectory = "/home/seres";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    dnsutils # `dig` + `nslookup`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing

    file
    which
    tree
    gnutar
    zstd
    gnupg

    # productivity
    btop # replacement of htop/nmon

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs = {
    git = {
      enable = true;
      userName = "seres";
      userEmail = "seres@seres.eu.org";
    };

    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin"
      '';

      shellAliases = {
      };
    };
    btop.enable = true;
    hyprlock.enable = true;
    wofi.enable = true;
  };

  stylix.enable = true;

  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;

  imports = [
    ./gtk.nix
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
    ./kitty.nix
    inputs.nvf.homeManagerModules.default
    ./neovim.nix
    ./vesktop.nix
    ./kde-connect.nix
    ./mime.nix
    ./easyeffects.nix
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
