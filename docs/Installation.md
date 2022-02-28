# [Installation](https://wiki.archlinux.org/title/Installation_guide)

## Download and Installation ISO Image

I used a torrent to download, and I seeded for a little while.

Filename: `archlinux-2021.07.01-x86_64.iso`

## Verify The Image Signature

Checksums:

```
File integrity checksums for the latest releases can be found below:
PGP signature
PGP fingerprint: 0x9741E8AC  --> https://keyserver.ubuntu.com/pks/lookup?op=vindex&fingerprint=on&exact=on&search=0x4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC
MD5: e87bf4073125ecab9a0f3e94d0ce130e
SHA1: 5804cefb2e5e7498cb15f38180cb3ebc094f6955
```

I got an error the first time I tried to verify this signature because the key
server returning the key did not include the user ID, but I was able to solve
the issue by following the instructions included in the following
[post](https://bbs.archlinux.org/viewtopic.php?id=255927):

```
$ gpg --locate-keys pierre@archlinux.de
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-2021.07.01-x86_64.iso.sig
```

Output:

```
gpg --keyserver-options auto-key-retrieve --verify archlinux-2021.07.01-x86_64.iso.sig
gpg: assuming signed data in 'archlinux-2021.07.01-x86_64.iso'
gpg: Signature made Thu 01 Jul 2021 08:52:23 AM CDT
gpg:				using RSA key 4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC
gpg: Good signature from "Pierre Schmitz <pierre@archlinux.de>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:		  There is no indication that the signature belongs to the owner.
Primary key fingerprint: 4AA4 767B BC9C 4B1D 18AE  28B7 7F2D 434B 9741 E8AC
```

## Prepare An Installation Medium

Run `lsblk` confirm the name of my USB flash drive. Then, unmount the drive and run:

```
$ sudo chmod 777 /dev/sdb
$ sudo dd bs=4M if=path/to/archlinux-version-x86_64.iso of=/dev/sdx conv=fsync oflag=direct status=progress
```

## Boot the Live Environment

* Disable "Secure Boot" in bios and reboot; you can re-enable it after the installation process

	NOTE: For HP 2000 press `f10` during startup to get to bios and `esc` to to choose boot options.

## Install Steps

Follow instructions on [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide#Installation) and [DistroTube](https://youtu.be/PQgyW10xD8s):

### 1. By default the keymap is set for US. (Skip unless you need a different keymap)

### 2. Check for working internet.

 - `# ping archlinux.org`

### 3. Make sure system clock is accurate. 

 - `# timedatectl set-ntp true`
 - `# timedateclt status` (Verify)

### 4. Partition the hard drive. NOTE: This is a critical step, proceed with caution.

- `# fdisk -l`
- `# fdisk /dev/[disk_name]`

Make the EFI system partition:

- `# g` <-- Create a new empty GPT partition table. (See 1 below.)
- `# n` <-- Adds a new partition. 
- `# 1` <-- Assign the default number "1" to first partition.
- `# <CR>` <-- Assign the first sector to the default, "2048".
- `# +550M` <-- Assign the last sector of this partition at 550 megabytes from the start. (See 2 and 3 below.)

Make the SWAP partition

- `# n`
- `# 2` <-- Use the default number "2".
- `# <CR>` <-- Use the default start, which is just after the end of the first partition.
- `# +2G` <-- Allot two gigabytes for the swap partition. (See 2 below.)

Make the partition for the filesystem :

- `# n`
- `# 3` <-- Use the default number "3".
- `# <CR>` <-- Use the default start location.
- `# <CR>` <-- Allot the remaining space on the drive.

Change the type of the first partition:

- `# t` <-- Change partition type.
- `# 1` <-- Indicate partition number "1".
- `# L` <-- List all available types.
- `# q` <-- Quit out of list
- `# <Number>` <-- Enter the correct number for "EFI System".

Change the type of the second partition: 

- `# t` <-- Change partition type.
- `# 1` <-- Indicate partition number "1".
- `# L` <-- List all available types.
- `# q` <-- Quit out of list
- `# <Number>` <-- Enter the correct number for "Linux swap".

Write the table and exit:

- `# w`

(1) An alert will appear if the device contains a 'dos' signature; it states that the signature will be removed by a write command.
(2) The partition is created as type 'Linux filesystem', which is not correct for the EFI system, but we will change this later.
(3) If there is a "ntfs" signature already the drive, it will ask if you want to remove it. 

### 5 Format the partitions

- `# mkfs.fat -F32 /dev/[disk_name]p1 (e.g. /dev/nvme0n1p1)` <-- Format partition 1.
- `# mkswap /dev/[disk_name]p2` <-- Format partition 2.
- `# swapon /dev/[disk_name]p2` <-- Turn on swap.
- `# mkfs.ext4 /dev/[disk_name]p3` Format partition 3.

### 6 Mount the file system

- `# mount /dev/[disk_name]p3 /mnt`

### 7 Run installation 

- `# pacstrap /mnt base linux linux-firmware`

### 8 Configure the system

- `# genfstab -U /mnt >> /mnt/etc/fstab` 
- `# arch-chroot /mnt` <-- Switch to root of new installation
- `# ln -sf /usr/share/zoneinfo/[Region]/[City] /etc/localtime` <-- Set the time
- `# hwclock --systohc` <-- Set the hardware clock

#### Set the locale

Install a text editor. 

- `# pacman -S vim` (If preferred, Nano can be installed: `# pacman -S nano`.)
- `# vim /etc/locale.gen`

Using the editor, uncomment the line `en_US.UTF-8 UTF-8`. Then save and quit. After editing that file, run the following:

- `# local-gen`

#### Set the hostname

- `# vim /etc/hostname`

In the editor, on the first line of the document, set the [hostname] (e.g. archvbox). Then save and exit.

#### Setup the "hosts" file

- `# vim /etc/hosts`

Using the editor, add the following: 

```
127.0.0.1	localhost
::1	    	localhost
127.0.1.1	[hostname].localdomain	[hostname]
```

#### Create some users and passwords

Set the password for root: 

- `# passwd`

Create an initial user:

- `# useradd -m [username]`
- `# passwd [username]`
- `# usermod -aG wheel,audio,video,optial,storage [username]` <-- add user to core groups, especially 'wheel' so the use can run `sudo`.

Install 'sudo':

- `# pacman -S sudo`
- `# EDITOR=vim visudo` <-- Enable the "wheel" group to have sudo priviledges.

Using the editor, uncomment the line that reads: `# %wheel ALL=(ALL) ALL`. Then save and quit.

#### Install GRUB.

- `# pacman -S grub efibootmgr dosfstools os-prober mtools`

Make an efi directory in the boot directory:

- `# mkdir /boot/EFI`
- `# mount /dev/[disk_name]p1 /boot/EFI`
- `# grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck` <-- Install grub.
- `# grub-mkconfig -o /boot/grub/grub.cfg` (See 1 below.)

(1) Regarding the following warning see [Arch Wiki](https://wiki.archlinux.org/title/GRUB): 

	Warning: os-prober will not be executed to detect other bootable
	partitions. Systems on them will not be added to the GRUB boot
	configuration. Check GRUB_DISABLE_OS_PROBER documentation entry.

#### Install `networkmanager` before rebooting

- `# pacman -S networkmanager network-manager-applet`
- `# systemctl enable NetworkManager`

### 9 Reboot

- `# exit` <-- Exit from root on system.
- `# umount -l /mnt` <-- Unmount lazily the partition we mounted earlier.
- `# reboot now`

### 10 Check for internet

- `# ping google.com`

### Setup wireless

- You should not run two DHCP clients simultaneously. 
- Instead of directly using a standalone DHCP client you can also use a network manager, some of which have a built-in DHCP client.
- Having NetworkManager installed... 

   `$ nmtui`

## Install [Xorg](https://wiki.archlinux.org/title/Xorg#Driver_installation) and a [Window Manager](https://wiki.archlinux.org/title/Window_manager)

### 1. Identify the graphics card and appropriate vieo driver

- `$ lspci -v | grep -A1 -e VGA -e 3D` <-- Identify the graphics card.
- `$ sudo pacman -Ss [appropriate_driver]`

### 2. Install essentials (Subject to choice.)

Essentials include a video driver, the Xorg package, a window manager, a compositor, a terminal emulator, and a web browser:

- `$ sudo pacman -S [appropriate_driver] xorg xorg-xinit i3-gaps nitrogen picom kitty firefox base-devel`
- `$ cp /etc/X11/xinit/xinitrc $HOME/.xinitrc`

Modify the end of the .xinitrc by commenting out the last five lines and adding:

```
nitrogen --restore &
picom &
exec i3
```

Test by running the following:

- `$ startx`

Adjust screen resolution:

- `$ xrandr`

## Enable Audio

### Setting up device

[Alsa docs](https://alsa-project.org/wiki/Setting_the_default_device) show how to find sound cards with:

`$ cat /proc/asound/cards`

Create a config file: `/etc/asound.conf`
Add to it the following:

```
defaults.pcm.card [number]
defaults.ctl.card [number]
```

System is muted by default. Install alsa-utils and make sure user is part of the audio group.

```
$ sudo pacman -S alsa-utils
$ sudo gpasswd -a [user name] audio
$ speaker-test -c2
```

Check your user has been granted audio priviledge.

```
$ groups [user name]
```

REF: 

- [Advance Linux Sound Architecture](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture)

	NOTE: HP 2000 laptop:
	00:01.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Wrestler HDMI Audio
	00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD] FCH Azalia Controller (rev 01)
