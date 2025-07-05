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
      base00 = "#242424"; # Black background base
      base01 = "#2c2c2c"; # Slightly lighter (panel background)
      base02 = "#3c3c3c"; # Selection background
      base03 = "#505050"; # Comments, invisibles, line highlighting
      base04 = "#888888"; # Dark foreground (status bars)
      base05 = "#ffffff"; # Default foreground
      base06 = "#f5f5f5"; # Light foreground (unused)
      base07 = "#ffffff"; # Light background
      base08 = "#f62b5a"; # Red
      base09 = "#ff4d51"; # Orange
      base0A = "#e3c401"; # Yellow
      base0B = "#47b413"; # Green
      base0C = "#13c299"; # Cyan
      base0D = "#24adc4"; # Blue
      base0E = "#f2affd"; # Purple
      base0F = "#35d450"; # Extra color (lime green)
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
