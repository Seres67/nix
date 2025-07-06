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
    vencord = {
      settings = {
        plugins = {
          CommandsAPI = {
            enabled = true;
          };
          MessageAccessoriesAPI = {
            enabled = true;
          };
          UserSettingsAPI = {
            enabled = true;
          };
          CrashHandler = {
            enabled = true;
          };
          WebKeybinds = {
            enabled = true;
          };
          WebScreenShareFixes = {
            enabled = true;
          };
          BadgeAPI = {
            enabled = true;
          };
        };
      };
    };
  };
}
