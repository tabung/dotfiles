# Swap configuration
{ config, lib, pkgs, ... }:

{
  swapDevices = [ ];

  # Enable zram
  zramSwap.enable = true;
}
