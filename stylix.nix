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
      base03 = "#474747";
      base04 = "#4e4e4e";
      base05 = "#ffffff";
      base06 = "#f5f5f5";
      base07 = "#ffffff";
      base08 = "#f62b5a";
      base09 = "#ff4d51";
      base0A = "#e3c401";
      base0B = "#47b413";
      base0C = "#13c299";
      base0D = "#24adc4";
      base0E = "#f2affd";
      base0F = "#35d450";
    };
    image = ./wallpaper.png;
    polarity = "dark";
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
