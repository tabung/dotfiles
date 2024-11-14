
{ config, pkgs, ... }:

let
  burp = import ../users/apps/burpsuite/default.nix  {
    lib = pkgs.lib;
    buildFHSEnv = pkgs.buildFHSEnv;
    fetchurl = pkgs.fetchurl;
    jdk = pkgs.openjdk;
    makeDesktopItem = pkgs.makeDesktopItem;
    unzip = pkgs.unzip;
  };
in

{
  # Other Home Manager configurations

  # Install Burp Suite
  home.packages = [
    burp
  ];

}
