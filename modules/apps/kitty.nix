{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family FiraCode Nerd Font Mono Ret
    font_size 11.0
    repaint_delay 8
    sync_to_monitor no
    enable_audio_bell no
    remember_window_size yes
    enabled_layouts tall
    foreground #ffffff
    background #242424

    color0 #242424
    color8 #616161

    #: black

    color1 #f62b5a
    color9 #ff4d51

    #: red

    color2  #47b413
    color10 #35d450

    #: green

    color3  #e3c401
    color11 #e9e836

    #: yellow

    color4  #24adc4
    color12 #5dc5f8

    #: blue

    color5  #f2affd
    color13 #feabf2

    #: magenta

    color6  #13c299
    color14 #24dfc4

    #: cyan

    color7  #e6e6e6
    color15 #ffffff

    #: white

    map ctrl+alt+& goto_tab 1
    map ctrl+alt+é goto_tab 2

    map ctrl+left neighboring_window left
    map ctrl+right neighboring_window right
    map ctrl+up neighboring_window up
    map ctrl+down neighboring_window down

    map ctrl+t send_text all nano $(fd --type f --hidden --follow | fzf)\r
  '';
}
