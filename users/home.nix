{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    remmina
    obsidian
    zotero
    libreoffice-fresh
    hunspell
    heroic
    tela-circle-icon-theme
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.battery-health-charging
  ];

  nixpkgs.config.allowUnfree = true;
   
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "Rezky Yuranda";
  }; 

  # Dconf
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer"  "xwayland-native-scaling" ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          #dash-to-dock.extensionUuid
          vitals.extensionUuid 
          battery-health-charging.extensionUuid
        ];
      };
    };
  };
 
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
