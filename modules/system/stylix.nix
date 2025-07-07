{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#242424"; # background
      base01 = "#2f2f2f"; # cursor line
      base02 = "#3c3c3c"; # selection
      base03 = "#616161"; # comments
      base04 = "#B0B0B0"; # secondary fg
      base05 = "#E6E6E6"; # main fg
      base06 = "#F0F0F0"; # brighter fg
      base07 = "#FFFFFF"; # lightest fg

      base08 = "#F62B5A"; # red (errors)
      base09 = "#FF6A1F"; # brred (warnings)
      base0A = "#E3C401"; # yellow (identifiers)
      base0B = "#47B413"; # green (strings)
      base0C = "#13C299"; # cyan (regex/support)
      base0D = "#24ACD4"; # blue (keywords)
      base0E = "#F2AFFD"; # magenta (types/special)
      base0F = "#24DFC4"; # brcyan (deprecated/misc)
    };
    polarity = "dark";
    image = ../../assets/wallpaper.png;
    cursor = {
      package = pkgs.rose-pine-cursor;
      size = 36;
      name = "BreezeX-RosePine-Linux";
    };
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraCode Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
