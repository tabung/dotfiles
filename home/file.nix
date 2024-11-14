{ config, pkgs, ... }:

{
  home.file = {
    # Misalnya, menambahkan file .screenrc
    # ".screenrc".source = ./dotfiles/screenrc;

    # Atau membuat file baru di direktori .gradle
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
}
