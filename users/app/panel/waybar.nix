{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}

      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 12px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        color: #FFFFFF;
        min-height: 20px;
      }

      window#waybar {
        border-bottom: none;
        background: transparent;
      }

      #custom-arch, #workspaces {
        border-radius: 10px;
        background-color: #272121;
        color: #FFFFFF;
        margin-top: 7px;
        margin-right: 15px;
        padding-top: 1px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #custom-arch {
        font-size: 20px;
        margin-left: 10px;
        color: #ffffff;
      }

      #workspaces button {
        background: #272121;
        color: #ffffff;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery{
        border-radius: 10px;
        background-color: #272121;
        color: #ffffff;
        margin-top: 7px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 10px;
      }

      #backlight, #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }

      #pulseaudio, #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }

      #clock {
        margin-right: 0;
      }
    '';
   settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };

      # Custom Modules Configuration
      modules-left = [ "custom/arch" "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

      # Custom Arch Module
      "custom/arch" = {
        format = " ❄ ";
        tooltip = false;
        on-click = "wofi --show drun";
      };

      # Workspace Module
      "hyprland/workspaces" = {
        format = "{name}";
        tooltip = false;
        all-outputs = true;
        format-icons = {
          active = "";
          default = "";
        };
      };

      # Clock Module
      clock = {
        format = "<span color='#ffffff'> </span>{:%H:%M}";
      };

      # Backlight Module
      backlight = {
        device = "amdgpu_bl1";
        format = "<span color='#ffffff'>{icon}</span> {percent}%";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
      };

      # Pulseaudio Module
      pulseaudio = {
        format = "<span color='#ffffff'>{icon}</span> {volume}%";
        format-muted = "";
        tooltip = false;
        format-icons = {
          headphone = "";
          default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
        };
        scroll-step = 1;
      };

      # Bluetooth Module
      bluetooth = {
        format = "<span color='#ffffff'></span> {status}";
        format-disabled = "";
        format-connected = "<span color='#ffffff'></span> {num_connections}";
        tooltip-format = "{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}   {device_address}";
      };

      # Network Module
      network = {
        interface = "wlp1s0";
        format = "{ifname}";
        format-wifi = "<span color='#ffffff'> </span>{essid}";
        format-ethernet = "{ipaddr}/{cidr} ";
        format-disconnected = "<span color='#ffffff'>󰖪 </span>No Network";
        tooltip = false;
      };

      # Battery Module
      battery = {
        format = "<span color='#ffffff'>{icon}</span> {capacity}%";
        format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
        format-charging = "<span color='#ffffff'></span> {capacity}%";
        tooltip = false;
      };
    }];
  };
}
