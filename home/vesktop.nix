{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      discordBranch = "stable";
      enableSplashScreen = false;
      minimizeToTray = false;
    };
  };
}
