{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  home.packages = with pkgs; [
    heroic
  ];
}

