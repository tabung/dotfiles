{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./tmux.nix
    ./file.nix
    ./session.nix
    ./burp.nix
    ./sh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "r3z";
  home.homeDirectory = "/home/r3z";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
  ];
  
  programs.home-manager.enable = true;
}
