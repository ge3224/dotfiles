#!/bin/bash
#
# Setup for ThinkPad T480

echo "Starting setup..."

# --------------Swap Fn & Ctrl Keys (Left Side)-----------------
# Enter Bios - Config > Keyboard/Mouse > Fn and Ctrl Key Swap

# ---------------------Make CapsLock Esc------------------------
# sudo sed -i 's/terminate:ctrl_alt_bksp/terminate:ctrl_alt_bksp,caps:escape_shifted_capslock/g' > sudo /etc/X11/xorg.conf.d/00-keyboard.conf
#
# Undo
# sudo sed -i 's/terminate:ctrl_alt_bksp,caps:escape_shifted_capslock/terminate:ctrl_alt_bksp/g' > sudo /etc/X11/xorg.conf.d/00-keyboard.conf

# -------------Accessing the clipboard in Neovim----------------
# sudo pacman -S xclip
#
# Undo:
# sudo pacman -Rs xclip

# -----------------------USB mounting---------------------------
# Usage: 
# - `lsblk` - identify the USB device
# - `sudo unmount /dev/<drive_name>` - unmount drive
# - `sudo mkfs.vfat /dev/<drive_name>` - format a drive
# - `udiskie` will startup via i3 config
# sudo pacman -S udisks2 udiskie
#
# Undo:
# sudo pacman -Rs udisks2 udiskie

# -------------------------LightDM------------------------------
# sudo pacman -S lightdm
#
# Undo:
# sudo pacman -Rs lightdm

# -----------------LightDM Webkit2 Greeter----------------------
# sudo pacman -S lightdm-webkit2-greeter
#
# Undo:
# sudo pacman -Rs lgithdm-webkit2-greeter

# --------------------------Keepass-----------------------------
sudo pacman -S keepass
#
# Undo:
# sudo pacman -Rs keepass

# -----------------------Home Folders---------------------------
# mkdir $HOME/Projects
# mkdir $HOME/Documents
# mkdir $HOME/Downloads
# mkdir $HOME/Design
# mkdir $HOME/Desktop

# ------------------Nerd Fonts Jet Brains-----------------------
# cd $HOME/Downloads/
# git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono-160.git
# cd ./nerd-fonts-jetbrains-mono-160/
# makepkg
# sudo pacman -U nerd-fonts-jetbrains-mono-*.tar.zst
#
# Undo:
# sudo pacman -Rs nerd-fonts-jetbrains-mono-160
