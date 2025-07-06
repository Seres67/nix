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
      base08 = "#f62b5a"; # red
      base09 = "#e3c401"; # orange
      base0A = "#e9e836"; # yellow
      base0B = "#47b413"; # green
      base0C = "#13c299"; # cyan
      base0D = "#24adc4"; # blue
      base0E = "#f2affd"; # purple
      base0F = "#feabf2"; # magenta
    };
    #:root {
#     --base00: #242424; /* Black */
#     --base01: #323232; /* Bright Black */
#     --base02: #404040; /* Grey */
#     --base03: #888888; /* Brighter Grey */
#     --base04: #9c9c9c; /* Bright Grey */
#     --base05: #e6e6e6; /* White */
#     --base06: #f5f5f5; /* Brighter White */
#     --base07: #ffffff; /* Bright White */
#     --base08: #e3c401; /* Red */
#     --base09: #24dfc4; /* Orange */
#     --base0A: #13c299; /* Yellow */
#     --base0B: #47b413; /* Green */
#     --base0C: #ff4d51; /* Cyan */
#     --base0D: #24acd4; /* Blue */
#     --base0E: #f2affd; /* Purple */
#     --base0F: #9b9b9b; /* Magenta */
#
#     --primary-630: var(--base00); /* Autocomplete background */
#     --primary-660: var(--base00); /* Search input background */
# }
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
