{ config, lib, pkgs, ... }:

{
  hardware.graphics.enable32Bit = true;

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
}
