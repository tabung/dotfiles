{ config, pkgs, ... }:

let
  plasmaConfigDir = "../systems/ui-environment/plasma/config";
  swayConfigDir = "../systems/ui-environment/sway/config"
in
{
  # Menggunakan kondisi untuk menentukan DE mana yang aktif
  if config.services.xserver.desktopManager.plasma6.enable then plasmaConfigDir 
    else swayConfigDir;
}

