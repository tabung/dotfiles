{config, pkgs, ... }: 
{
  # ini waybar config
  home.file."~/.config/waybar/config".text = ''
    {
        "layer": "top",
        "output": ["eDP-1", "VGA"],
        "modules-left": ["custom/arch", "hyprland/workspaces", "hyprland/language", "keyboard-state", "hyprland/submap"],
        "modules-center": ["clock"],
        "modules-right": ["backlight", "pulseaudio", "bluetooth", "network", "battery"],
        "custom/arch": {
        "format": "  ",
        "tooltip": false,
        "on-click": "wofi --show drun"
        },
        "hyprland/workspaces": {
        "format": "{name}",
        "format": "{icon}",
        "tooltip": false,
        "all-outputs": true,
        "format-icons": {
            "active": "",
            "default": ""
        }
        },
        "hyprland/language": {
        "format": "{} ",
        "min-length": 5,
        "tooltip": false
        },
        "keyboard-state": {
        "capslock": true,
        "format": "{name} {icon} ",
        "format-icons": {
            "locked": " ",
            "unlocked": ""
        }
        },
        "hyprland/submap": {
            "format": "<span style=\"italic\">{}</span>"
        },
        "clock": {
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format": "{:%a, %d %b, %I:%M %p}"
        },
        "backlight": {
        "device": "amd_backlight",
        "format": "<span color='#ffffff'>{icon}</span> {percent}%",
        "format-icons": ["", "", "", "", "", "", "", "", ""]
        },
        "pulseaudio": {
        "format": "<span color='#ffffff'>{icon}</span> {volume}%",
        "format-muted": "",
        "tooltip": false,
        "format-icons": {
            "headphone": "",
            "default": ["", "", "󰕾", "󰕾", "󰕾", "", "", ""]
        },
        "scroll-step": 1,
        },
        "bluetooth": {
        "format": "<span color='#ffffff'></span> {status}",
        "format-disabled": "", // an empty format will hide the module
        "format-connected": "<span color='#f0e9effffff4'></span> {num_connections}",
        "tooltip-format": "{device_enumerate}",
        "tooltip-format-enumerate-connected": "{device_alias}   {device_address}"
        },
        "network": {
        "interface": "wlp1s0",
        "format": "{ifname}",
        "format-wifi": "<span color='#f0e9ffffffe4'> </span>{essid}",
        "format-ethernet": "{ipaddr}/{cidr} ",
        "format-disconnected": "<span color='#ffffff'>󰖪 </span>No Network",
        "tooltip": false,
        },
        "battery": {
        "format": "<span color='#ffffff'>{icon}</span> {capacity}%",
        "format-icons": ["", "", "", "", "", "", "", "", "", ""],
        "format-charging": "<span color='#ffffff'></span> {capacity}%",
        "tooltip": false,
        },
    }
  '';
  
  home.file."~/.config/waybar/style.css".text = ''
    * {
      border: none;
      font-family: 'Fira Code', 'Symbols Nerd Font Mono';
      font-size: 12px;
      font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
      min-height: 20px;
    }

    window#waybar {
      background: transparent;
    }

    #custom-arch, #workspaces {
      border-radius: 10px;
      background-color: #383c4a;
      color: #ffffff;
      margin-top: 5px;
      margin-right: 15px;
      padding: 1px 10px;
    }

    #custom-arch {
      font-size: 13px;
      margin-left: 15px;
      color: #ffffff;
    }

    #workspaces button {
      background: #383c4a;
      color: #ffffff;
    }

    #language, #keyboard-state, #submap {
      border-radius: 10px;
      background-color: #383c4a;
      color: #ffffff;
      margin-top: 5px;
      margin-right: 15px;
      padding: 0 10px;
    }

    #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery {
      border-radius: 10px;
      background-color: #383c4a;
      color: #ffffff;
      margin-top: 5px;
      margin-right: 15px;
      padding: 0 10px;
    }

    #backlight, #bluetooth, #language {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
      padding-right: 5px;
      margin-right: 0;
    }

    #pulseaudio, #network, #keyboard-state {
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
      padding-left: 5px;
    }

    #clock {
      margin-right: 0;
    }
  '';
}