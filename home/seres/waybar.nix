{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        mode = "dock";
        margin-top = 5;
        margin-bottom = 5;
        margin-left = 5;
        margin-right = 5;
        height = 30;
        modules-left = [
          "tray"
          "mpris"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "network"
          "temperature"
          "battery"
          "clock"
        ];
        "hyprland/window" = {
          format = "{}";
          max-length = 35;
          separate-outputs = true;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%A %d %B %Y}";
        };
        "cpu" = {
          format = " {usage}%";
        };
        "memory" = {
          format = " {}%";
        };
        "temperature" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp2_input";
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = [
            ""
          ];
        };
        "battery" = {
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "network" = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀 {cidr}";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = " ⚠ ";
          format-alt = "{ifname}= {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          format = "{icon} {volume}%  {format_source}";
          format-bluetooth = "󰋋 {volume}%  {format_source}";
          format-bluetooth-muted = "󰟎 {volume}%  {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          format-icons = {
            "headphone" = "󰋋";
            "hands-free" = "";
            "headset" = "󰋎";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          reverse-scrolling = true;
        };
        "tray" = {
          spacing = 5;
        };
        "mpris" = {
          format = "{artist} - {title}";
          max-length = 60;
        };
        "custom/mako" = {
          format = "{}";
          signal = 1;
          return-type = "json";
          exec = "~/.config/waybar/scripts/mako.sh";
          on-click = "makoctl mode -t dnd";
        };
      };
    };
    style = ''
      * {
        font-family: "FiraCode Nerd Font";
        font-size: 16px;
      }

      window#waybar {
        border-radius: 13px;
      }

      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }

      button:hover {
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
      }

      #workspaces button.active {
        background-color: transparent;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #tray,
      #mpris,
      #custom-mako,
      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #network,
      #pulseaudio {
        padding: 0 10px;
      }

      #custom-mako.active {
        padding-left: 7px;
        margin-right: 3px;
      }

      .modules-right,
      .modules-left,
      .modules-center {
        border-radius: 15px;
        padding: 0 10px;
      }
      .modules-right {
        padding: 0 10px;
      }

      .modules-center {
        padding: 0 10px;
      }

      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
