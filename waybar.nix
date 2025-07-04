{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  environment.etc."xdg/waybar/config".text = ''
    {
       "layer": "top",
       "mode": "dock",
       "margin-top":5,
       "margin-bottom": 5,
       "margin-left":10,
       "margin-right":10,
       "height":30,
       "modules-left":[
           "tray",
           "mpris",
       ],
       "modules-center":[
          "sway/workspaces"
       ],
       "modules-right":[
          "cpu",
          "memory",
          "pulseaudio",
          "network",
          "temperature",
          "battery",
          "clock",
       ],
       "sway/window":{
          "format":"{}",
          "max-length":35,
          "separate-outputs": true
       },
       "sway/workspaces":{
          "on-click":"activate",
          "sort-by-number": true
       },
       "clock":{
          "tooltip-format":"<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
          "format-alt":"{:%A %d %B %Y}"
       },
       "cpu":{
          "format":" {usage}%",
       },
       "memory":{
          "format":" {}%"
       },
       "temperature":{
          "hwmon-path":"/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon3/temp1_input",
          "critical-threshold":80,
          "format":"{icon} {temperatureC}°C",
          "format-icons":[
             ""
          ]
       },
       "battery":{
          "states":{
             "warning":30,
             "critical":15
          },
          "format":"{icon} {capacity}%",
          "format-full":"{icon} {capacity}%",
          "format-charging":"󱐋 {capacity}%",
          "format-plugged":" {capacity}%",
          "format-alt":"{time} {icon}",
          "format-icons":[
             "",
             "",
             "",
             "",
             ""
          ]
       },
       "network":{
          "format-wifi":"  {signalStrength}%",
          "format-ethernet":"󰈀 {cidr}",
          "tooltip-format":"{ifname} via {gwaddr}",
          "format-linked":"{ifname} (No IP) ",
          "format-disconnected":" ⚠ ",
          "format-alt":"{ifname}: {ipaddr}/{cidr}"
       },
       "pulseaudio":{
          "format":"{icon}  {volume}%",
          "format-bluetooth":"󰋋 {volume}%",
          "format-bluetooth-muted":"󰟎 {volume}%",
          "format-muted":" {volume}%",
          "format-icons":{
             "headphone":"󰋋",
             "hands-free":"",
             "headset":"󰋎",
             "phone":"",
             "portable":"",
             "car":"",
             "default":[
                "",
                "",
                ""
             ]
          },
          "on-click":"pactl set-sink-mute @DEFAULT_SINK@ toggle",
          "reverse-scrolling": true,
       },
       "tray": {
           "spacing": 5,
       },
       "mpris": {
           "format": "{artist} - {title}",
           "max-length": 60,
       },
       "custom/mako": {
           "format": "{}",
           "signal": 1,
           "return-type": "json",
           "exec": "~/.config/waybar/scripts/mako.sh",
           "on-click": "makoctl mode -t dnd"
       }
    }
     
  '';

  environment.etc."xdg/waybar/style.css".text = ''
      @import "macchiato.css";

    * {
      font-family: "FiraCode Nerd Font";
      font-size: 16px;
    }

    window#waybar {
      background-color: rgba(0, 0, 0, 0);
      border-radius: 13px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }

    button {
      /* Use box-shadow instead of border so the text isn't offset */
      box-shadow: inset 0 -3px transparent;
      /* Avoid rounded borders under each button name */
      border: none;
      border-radius: 0;
    }

    /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
    button:hover {
      background: inherit;
      box-shadow: inset 0 -3px #ffffff;
    }

    #workspaces button {
      padding: 0 5px;
      background-color: transparent;
      color: #ffffff;
    }

    #workspaces button.active {
      box-shadow: inset 0 3px @red;
      background-color: transparent;
    }

    #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
    }

    #workspaces button.focused {
      /* background-color: @lavender; */
      box-shadow: inset 0 -3px #ffffff;
    }

    #workspaces button.urgent {
      background-color: #eb4d4b;
    }

    #mode {
      background-color: #64727d;
      box-shadow: inset 0 -3px #ffffff;
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

    #cpu {
      color: @red;
    }

    #memory {
      color: @peach;
    }

    #pulseaudio {
      color: @yellow;
    }

    #network {
      color: @green;
    }

    #temperature {
      color: @sky;
    }

    #battery {
      color: @mauve;
    }

    #clock {
      color: @rosewater;
    }

    #window {
      color: @rosewater;
    }

    #mpris {
      color: @green;
    }

    #custom-mako {
      color: rgb(255, 255, 255);
    }

    #custom-mako.active {
      padding-left: 7px;
      margin-right: 3px;
      color: @blue;
    }

    .modules-right,
    .modules-left,
    .modules-center {
      background-color: @base;
      border-radius: 15px;
      padding: 0 10px;
    }
    .modules-right {
      padding: 0 10px;
    }

    .modules-center {
      padding: 0 10px;
    }

    #battery.charging,
    #battery.plugged {
      color: @pink;
    }

    @keyframes blink {
      to {
        color: #000000;
      }
    }

    /* Using steps() instead of linear as a timing function to limit cpu usage */
    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: steps(12);
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    label:focus {
      background-color: #000000;
    }

    #pulseaudio.muted {
      color: @red;
    }
  '';

  environment.etc."xdg/waybar/macchiato.css".text = ''
    @define-color rosewater #f4dbd6;
    @define-color flamingo #f0c6c6;
    @define-color pink #f5bde6;
    @define-color mauve #c6a0f6;
    @define-color red #ed8796;
    @define-color maroon #ee99a0;
    @define-color peach #f5a97f;
    @define-color yellow #eed49f;
    @define-color green #a6da95;
    @define-color teal #8bd5ca;
    @define-color sky #91d7e3;
    @define-color sapphire #7dc4e4;
    @define-color blue #8aadf4;
    @define-color lavender #b7bdf8;
    @define-color text #cad3f5;
    @define-color subtext1 #b8c0e0;
    @define-color subtext0 #a5adcb;
    @define-color overlay2 #939ab7;
    @define-color overlay1 #8087a2;
    @define-color overlay0 #6e738d;
    @define-color surface2 #5b6078;
    @define-color surface1 #494d64;
    @define-color surface0 #363a4f;
    @define-color base #24273a;
    @define-color mantle #1e2030;
    @define-color crust #181926;
  '';
}
