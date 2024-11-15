{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      ./bluetooth.nix
      ./swap.nix
      ./graphics.nix
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/42f6f686-6bd5-4611-b74d-3547074656c0";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd"];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/42f6f686-6bd5-4611-b74d-3547074656c0";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd"];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/42f6f686-6bd5-4611-b74d-3547074656c0";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime"];
    };

  fileSystems."/.snapshots" =
    { device = "/dev/disk/by-uuid/42f6f686-6bd5-4611-b74d-3547074656c0";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" "compress=zstd"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D388-D976";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
