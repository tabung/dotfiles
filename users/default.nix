{ config, pkgs, ... }:

{
  imports = [
    ./themes/gtk.nix
    ./apps/kitty.nix
    ./apps/tmux.nix
    ./apps/zsh.nix
    ./configs/hyprland.nix
    ./configs/waybar.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    git
    wofi
    waybar
    git
    hyprpaper
    obsidian
    telegram-desktop
    vscode
    pavucontrol
  ];

  # Allow Un free
  nixpkgs.config.allowUnfree = true;
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
