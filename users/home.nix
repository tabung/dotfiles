{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    ./apps/zsh.nix
  ];

  home.username = "r3z";
  home.homeDirectory = "/home/r3z";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    remmina
    heroic

    obsidian
    libreoffice
    zotero
    
    #android-studio
    #jetbrains.phpstorm
    #jetbrains.goland
    #jetbrains.datagrip
    #jetbrains.jdk
    
    tela-circle-icon-theme
    tela-icon-theme
    gnome-tweaks
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
      #"org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer"  "xwayland-native-scaling" ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          caffeine.extensionUuid
          battery-health-charging.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "Tela-light";
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
