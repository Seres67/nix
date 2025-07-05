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
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
        themeLinks = [ ];
        eagerPatches = false;
        enabledThemes = [ ];
        enableReactDevtools = false;
        frameless = false;
        transparent = false;
        winCtrlQ = false;
        disableMinSize = false;
        winNativeTitleBar = false;
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
        notifications = {
          timeout = 5000;
          position = "bottom-right";
          useNative = "not-focused";
          logLimit = 50;
        };
        cloud = {
          authenticated = false;
          url = "https =//api.vencord.dev/";
          settingsSync = false;
          settingsSyncVersion = 1751589124509;
        };
      };
    };
  };
}
