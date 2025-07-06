{ std, pkgs, ... }:
let
  inherit (std) list;
  brightnessStep = 5;
  volumeStep = 2;
  term = "kitty";
in
{
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
        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.4;
          disable_while_typing = false;
        };
      };
      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        col.inactive_border = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

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
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_status = true;
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = true;
      };

      misc = {
        focus_on_activate = true;
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device = {
        name = "logitech-g502-hero-gaming-mouse";
        sensitivity = 0.18;
        accel_profile = "flat";
      };
      exec-once = [
        "${pkgs.dbus}/bin/dbus-update-activation-environment --all"
        "${pkgs.dbus}/bin/dbus-update-activation-environment --all"
        "${pkgs.mako}/bin/mako"
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
        ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +${volumeStep}%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -${volumeStep}%"
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
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
          "$mod SHIFT, S, exec, grim -g '$(slurp)' $(xdg-user-dir PICTURES)/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
          ", Print, exec, grim - | wl-copy -t image/png"
          "$mod SHIFT, P, exec, hyprpicker | wl-copy"
          "$mod, L, exec, hyprlock"
          "$mod, period, exec, wofi-emoji"
          "$mod SHIFT, X, exec, hyprctl kill"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          list.concat (
            list.generate (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
                "$mod, F${if ws == "0" then "10" else ws}, workspace, ${toString (x + 11)}"
                "$mod SHIFT, F${if ws == "0" then "10" else ws}, movetoworkspacesilent, ${toString (x + 11)}"

                "$mod ALT, ${ws}, split-workspace, ${toString (x + 1)}"
                "$mod SHIFT ALT, ${ws}, split-movetoworkspacesilent, ${toString (x + 1)}"
                "$mod ALT, F${if ws == "0" then "10" else ws}, split-workspace, ${toString (x + 11)}"
                "$mod SHIFT ALT, F${
                  if ws == "0" then "10" else ws
                }, split-movetoworkspacesilent, ${toString (x + 11)}"
              ]
            ) 10
          )
        );
    };
  };
}
