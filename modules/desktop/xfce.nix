_: {
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
}
