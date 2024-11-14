# Default hardware configuration
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      ./bluetooth.nix
      ./filesystems.nix
      ./graphics.nix
      ./kernel-modules.nix
      ./swap.nix
    ];
}
