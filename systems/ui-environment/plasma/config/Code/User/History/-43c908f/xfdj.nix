{ config, pkgs, ... }:

let
  plasmaConfigDir = "../";
  swayConfigDir = "/etc/nixos/system/ui-environment/sway/.config";
in
{
  # Menggunakan kondisi untuk menentukan DE mana yang aktif
  home.file.".config".source = if config.services.xserver.desktopManager.plasma5.enable then plasmaConfigDir else swayConfigDir;
}

