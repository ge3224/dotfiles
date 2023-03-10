#!/bin/bash
#
# Setup for ThinkPad T480

echo "Starting setup..."

# --------------Swap Fn & Ctrl Keys (Left Side)-----------------
# Enter Bios - Config > Keyboard/Mouse > Fn and Ctrl Key Swap

# ---------------------Make CapsLock Esc------------------------
sudo sed -i '/Option "XkbOptions" "terminate:ctrl_alt_bksp/Option "XkbOptions" "terminate:ctrl_alt_bksp,caps:escape_shifted_capslock/g"' sudo nvim /etc/X11/xorg.conf.d/00-keyboard.conf

# -------------Accessing the clipboard in Neovim----------------
# sudo pacman -S xclip
# sudo pacman -Rs xclip

# -----------------------USB mounting---------------------------
# Usage: 
# - `lsblk` - identify the USB device
# - `sudo unmount /dev/<drive_name>` - unmount drive
# - `sudo mkfs.vfat /dev/<drive_name>` - format a drive
# - `udiskie` will startup via i3 config
# sudo pacman -S udisks2 udiskie
# sudo pacman -Rs udisks2 udiskie
