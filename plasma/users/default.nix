{ config, pkgs, ... }:

{
  imports = [
    ./apps/terminal/kitty.nix
    ./apps/terminal/tmux.nix
    ./file.nix
    ./session.nix
    ./apps/burpsuite/burp.nix
    ./apps/terminal/sh.nix
    ./apps/game/game.nix
    ./apps/code/vscode.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "r3z";
  home.homeDirectory = "/home/r3z";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
  ];
  
  programs.home-manager.enable = true;
}
