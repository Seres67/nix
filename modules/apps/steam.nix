_: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}
