{ config, lib, pkgs, ... }:

{
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
}
