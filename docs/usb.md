# USB drives

## Setting up USB auto mounting, aka hot-plugging

`$ sudo pacman -S udisks2` <-- foundation 
`$ sudo pacman -S udiskie` <-- provides auto-mounting and alerts

## Formatting a USB Drive

1. locate the drive

`$ df`

2. Unmount & format

`$ sudo unmount /dev/<drive_name>`
`$ sudo mkfs.vfat /dev/<drive_name>` (other options: `mkfs.ntfs`, `mkfs.exfat`)

3. Verify

`$ sudo fsck /dev/<drive_name>`

## Rename a volume

`$ sudo umount /dev/<drive_name>`
`$ sudo mlabel -i /dev/<drive_name>`
