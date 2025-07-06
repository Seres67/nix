{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  environment.etc."sway/config".text = ''
        set $mod Mod4
        set $left h
        set $down j
        set $up k
        set $right l

        set $term kitty

        set $menu wofi -s /etc/wofi/styles.css --show "drun" --terminal kitty

        set $lock swaylock -f -C /etc/swaylock/config

        # Font
        font pango:FiraCode Nerd Font Mono Ret 13

        ### Output configuration
        #
        output * bg /etc/nixos/assets/wallpaper.png fill

        # You can get the names of your outputs by running: swaymsg -t get_outputs
        output eDP-1 resolution 1920x1080 position 0,0
        output HDMI-A-1 resolution 2560x1440 position 1920,0
        output DP-1 resolution 1920x1080 position 0,0

        exec swayidle -w \
                 timeout 300 '$lock' \
                 timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
                 before-sleep '$lock'

        # Start notifications
        exec mako

        # Start bluetooth
        exec blueman-applet

        # Start equalizer
        exec easyeffects --gapplication-service

        input "7504:24926:Corne_Keyboard" {
          xkb_layout us
          xkb_variant intl
          xkb_options "caps:backspace"
          repeat_rate 40
          repeat_delay 200
        }

        input "1:1:AT_Translated_Set_2_keyboard" {
          xkb_layout us
          xkb_variant intl
          xkb_options "caps:backspace"
          repeat_rate 40
          repeat_delay 200
        }

        input "1267:12608:ELAN06FA:00_04F3:3140_Touchpad" {
          dwt disabled
          tap enabled
          middle_emulation enabled 
          natural_scroll enabled
        }

        input "1133:49291:Logitech_G502_HERO_Gaming_Mouse" {
          accel_profile "flat"
          pointer_accel -0.35
        }

        input "9610:356:BY_Tech_KEMOVE_K87SE-1980" {
          xkb_layout us
          xkb_variant intl
          xkb_options "caps:backspace"
          repeat_rate 40
          repeat_delay 200
        }

        input "12538:5184:INSTANT_Inphic_PG1_GamingMouse" {
          accel_profile "flat"
          pointer_accel 0.18
        }

        # Start a terminal
        bindsym $mod+Return exec $term

        # Kill focused window
        bindsym $mod+Shift+q kill

        # Start your launcher
        bindsym $mod+d exec $menu

        floating_modifier $mod normal

        # Reload the configuration file
        bindsym $mod+Shift+c reload

        # Exit sway (logs you out of your Wayland session)
        bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right

        # Move the focused window with the same, but add Shift
        bindsym $mod+Shift+$left move left
        bindsym $mod+Shift+$down move down
        bindsym $mod+Shift+$up move up
        bindsym $mod+Shift+$right move right
        # Ditto, with arrow keys
        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        # Fix workspace to display
        workspace 1 output eDP-1
        workspace 2 output eDP-1
        workspace 3 output eDP-1
        workspace 4 output eDP-1
        workspace 5 output eDP-1
        workspace 6 output HDMI-A-1
        workspace 7 output HDMI-A-1
        workspace 8 output HDMI-A-1
        workspace 9 output HDMI-A-1
        workspace 10 output HDMI-A-1

        # Switch to workspace
        bindsym $mod+1 workspace number 1
        bindsym $mod+2 workspace number 2
        bindsym $mod+3 workspace number 3
        bindsym $mod+4 workspace number 4
        bindsym $mod+5 workspace number 5
        bindsym $mod+6 workspace number 6
        bindsym $mod+7 workspace number 7
        bindsym $mod+8 workspace number 8
        bindsym $mod+9 workspace number 9
        bindsym $mod+0 workspace number 10

        # Move focused container to workspace
        bindsym $mod+Shift+1 move container to workspace number 1
        bindsym $mod+Shift+2 move container to workspace number 2
        bindsym $mod+Shift+3 move container to workspace number 3
        bindsym $mod+Shift+4 move container to workspace number 4
        bindsym $mod+Shift+5 move container to workspace number 5
        bindsym $mod+Shift+6 move container to workspace number 6
        bindsym $mod+Shift+7 move container to workspace number 7
        bindsym $mod+Shift+8 move container to workspace number 8
        bindsym $mod+Shift+9 move container to workspace number 9
        bindsym $mod+Shift+0 move container to workspace number 10

       bindgesture swipe:4:right workspace prev
       bindgesture swipe:4:left workspace next

       bindgesture swipe:3:right exec playerctl next
       bindgesture swipe:3:left exec playerctl previous

       bindsym $mod+period exec wofi-emoji

        bindsym $mod+b splith
        bindsym $mod+v splitv

        # Switch the current container between different layout styles
        bindsym $mod+s layout stacking
        bindsym $mod+w layout tabbed
        bindsym $mod+e layout toggle split

        # Make the current focus fullscreen
        bindsym $mod+f fullscreen

        # Hide waybar
        bindsym $mod+Shift+f exec pkill -SIGUSR1 waybar

        # Toggle the current focus between tiling and floating mode
        bindsym $mod+Shift+space floating toggle

        # Swap focus between the tiling area and the floating area
        bindsym $mod+space focus mode_toggle

        # Move focus to the parent container
        bindsym $mod+a focus parent

        # Move the currently focused window to the scratchpad
        bindsym $mod+Shift+minus move scratchpad

        # Show the next scratchpad window or hide the focused scratchpad window.
        # If there are multiple scratchpad windows, this command cycles through them.
        bindsym $mod+minus scratchpad show

        mode "resize" {
            # left will shrink the containers width
            # right will grow the containers width
            # up will shrink the containers height
            # down will grow the containers height
            bindsym $left resize shrink width 10px
            bindsym $down resize grow height 10px
            bindsym $up resize shrink height 10px
            bindsym $right resize grow width 10px

            # Ditto, with arrow keys
            bindsym Left resize shrink width 10px
            bindsym Down resize grow height 10px
            bindsym Up resize shrink height 10px
            bindsym Right resize grow width 10px

            # Return to default mode
            bindsym Return mode "default"
            bindsym Escape mode "default"
        }
        bindsym $mod+r mode "resize"

        # Lock
        bindsym $mod+l exec $lock

        # Screenshot
        bindsym $mod+Shift+s exec slurp | grim -g - $(xdg-user-dir PICTURES)/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')

        # Lock on lid close
        bindswitch lid:off exec $lock

        # Brightness
        bindsym XF86MonBrightnessUp exec brightnessctl set 5%+
        bindsym XF86MonBrightnessDown exec brightnessctl set 5%-

        # Audio
        bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
        bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-

        bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

        bindsym XF86AudioPlay exec playerctl play-pause
        bindsym XF86AudioNext exec playerctl next
        bindsym XF86AudioPrev exec playerctl previous

        # Color picker
        bindsym $mod+Shift+p exec grim -g "$(slurp -p)" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4 | wl-copy
        # Disable window borders
        default_border pixel 2

        bar {
          swaybar_command waybar
        }

        # Window rules
        for_window [app_id="^zen$" title="^Extension: "] floating enable, sticky enable
        for_window [app_id="^zen$" title="^Picture-in-Picture$"] floating enable, sticky enable
        for_window [class="^vesktop$" title="^› ça stream 𓂃⋆.˚$"] floating enable, sticky enable
        for_window [app_id="^org.kde.kdeconnect.daemon$"] fullscreen disable, floating enable, resize set 1920 1080

        # Import the most important environment variables into the D-Bus and systemd
    # user environments (e.g. required for screen sharing and Pinentry prompts):
    exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
    # enable systemd-integration
    exec "systemctl --user import-environment {,WAYLAND_}DISPLAY SWAYSOCK; systemctl --user start sway-session.target"
    exec swaymsg -t subscribe '["shutdown"]' && systemctl --user stop sway-session.target
  '';
}
