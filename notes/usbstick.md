# Formatting USB stick

- `lsblk` or use `df`
- `sudo umount /dev/sdb1`
- `sudo mkfs.vfat -F 32 /dev/sdb1`
- Or use `sudo mkfs.vfat -F 32 -n 'name_for_your_pendrive' /dev/sdb1`
