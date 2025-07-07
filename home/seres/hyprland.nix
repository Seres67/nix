{
  lib,
  pkgs,
  ...
}: let
  brightnessStep = "5";
  volumeStep = "2";
  term = "kitty";
in {
  services.hyprpaper.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        kb_layout = "us";
        kb_variant = "intl";
        repeat_rate = 40;
        repeat_delay = 200;
        mouse_refocus = false;
        follow_mouse = true;
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.4;
          disable_while_typing = false;
        };
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };
      animations.enabled = false;
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = true;
      };
      gestures = {
        workspace_swipe = true;
      };
      misc = {
        font_family = "FiraCode Nerd Font";
        focus_on_activate = true;
      };
      device = {
        name = "logitech-g502-hero-gaming-mouse";
        sensitivity = 0.18;
        accel_profile = "flat";
      };
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
        ", preferred, auto, 1"
      ];
      exec-once = [
        "${pkgs.dbus}/bin/dbus-update-activation-environment --all"
        "${pkgs.mako}/bin/mako"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      binde = [
        ", XF86MonBrightnessUp, exec, brightnessctl set ${brightnessStep}%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set ${brightnessStep}%-"
      ];
      bindl = [
        ", switch:on:Lid Switch, exec, hyprlock --immediate"
      ];
      bindle = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ ${volumeStep}%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ ${volumeStep}%-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      bind =
        [
          "$mod, Return, exec, ${term}"
          "$mod SHIFT, Q, killactive,"
          "$mod SHIFT, E, exit,"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          "$mod, D, exec, wofi -s /etc/wofi/styles.css --show drun --terminal kitty"
          "$mod, P, pseudo,"
          "$mod, J, togglesplit,"
          "$mod SHIFT, Space, togglefloating,"
          "$mod, F, fullscreen"
          "$mod SHIFT, S, exec, slurp | grim -g - $(xdg-user-dir PICTURES)/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
          ", Print, exec, grim - | wl-copy -t image/png"
          "$mod SHIFT, P, exec, hyprpicker | wl-copy"
          "$mod, L, exec, hyprlock"
          "$mod, period, exec, wofi-emoji"
          "$mod SHIFT, X, exec, hyprctl kill"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          lib.lists.concatLists (
            lib.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
                "$mod, F${
                  if ws == "0"
                  then "10"
                  else ws
                }, workspace, ${toString (x + 11)}"
                "$mod SHIFT, F${
                  if ws == "0"
                  then "10"
                  else ws
                }, movetoworkspacesilent, ${toString (x + 11)}"
              ]
            )
            10
          )
        );
      windowrulev2 = [
        "float, class:^(org.kde.kdeconnect.daemon)$"
        "noblur, class:^(org.kde.kdeconnect.daemon)$"
        "xray, class:^(org.kde.kdeconnect.daemon)$"
        "size 1920 1080, class:^(org.kde.kdeconnect.daemon)$"
        "pin, class:^(org.kde.kdeconnect.daemon)$"
      ];
    };
  };
}
