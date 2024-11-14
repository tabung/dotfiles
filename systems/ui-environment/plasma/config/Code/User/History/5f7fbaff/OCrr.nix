{ config, pkgs, ... }:

let
  # Define the custom package location
  burpsuite = import ./default.nix {
    lib = pkgs.lib;  # Memberikan 'lib' dari 'pkgs'
    fetchurl = pkgs.fetchurl;  # Memberikan 'fetchurl' dari 'pkgs'
    jdk = pkgs.openjdk;  # Memberikan JDK dari 'pkgs'
    makeDesktopItem = pkgs.makeDesktopItem;  # Memberikan makeDesktopItem dari 'pkgs'
    unzip = pkgs.unzip;  # Memberikan unzip dari 'pkgs'
    buildFHSEnv = pkgs.buildFHSEnv;  # Memberikan buildFHSEnv dari 'pkgs'
  };
in
{
  # Include the package in the system environment
  home.packages = [
    burpsuite
  ];
}
