{pkgs, ...}: {
  environment.pathsToLink = ["/libexec"];

  services.xserver = {
    enable = true;

    displayManager.startx.enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3blocks #if you are planning on using i3blocks over i3status
      ];
    };
  };
  programs.i3lock.enable = true;
}
