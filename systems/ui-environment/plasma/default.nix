{ config, pkgs, ... }:

{
  # Enable Plasma Desktop environment
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Install additional Plasma apps
  environment.systemPackages = with pkgs; [
    plasma5.kdeApplications.kate
    plasma5.kdeApplications.krita
    plasma5.kdeApplications.kdenlive
    plasma5.kdeApplications.dolphin
  ];
}