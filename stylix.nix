{
  config,
  pkgs,
  lib,
  ...
}:

{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#242424";
      base01 = "#323232";
      base02 = "#404040";
      base03 = "#888888";
      base04 = "#9c9c9c";
      base05 = "#e6e6e6";
      base06 = "#f5f5f5";
      base07 = "#ffffff";
      base08 = "#E3C401";
      base09 = "#24DFC4";
      base0A = "#13C299";
      base0B = "#47B413";
      base0C = "#FF4D51";
      base0D = "#24ACD4";
      base0E = "#F2AFFD";
      base0F = "#9b9b9b";
    };
    polarity = "dark";
    image = ./wallpaper.png;
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
