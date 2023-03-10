#!/bin/bash
#
# Setup for ThinkPad T480
#
# --------------Swap Fn & Ctrl Keys (Left Side)-----------------
# Enter Bios - Config > Keyboard/Mouse > Fn and Ctrl Key Swap
#
# ----------Extra Packages to Include with archinstall----------
# base-devel git neovim kitty firefox

echo "Starting setup..."

# -----------------------Home Folders---------------------------
mkdir $HOME/Projects
mkdir $HOME/Documents
mkdir $HOME/Downloads
mkdir $HOME/Design
mkdir $HOME/Desktop

# ----------------Move Dotfiles to Projects---------------------
mv ../../dotfiles/ $HOME/Projects/
cd $HOME/Projects/dotfiles/bijiben/
cd $HOME

# ---------------------Make CapsLock Esc------------------------
sudo sed -i 's/terminate:ctrl_alt_bksp/terminate:ctrl_alt_bksp,caps:escape_shifted_capslock/g' > sudo /etc/X11/xorg.conf.d/00-keyboard.conf

# -------------------More Utility Packages----------------------
sudo pacman -S htop keepass unzip zip nitrogen  picom

# -----------------------USB mounting---------------------------
# Usage: 
# - `lsblk` - identify the USB device
# - `sudo unmount /dev/<drive_name>` - unmount drive
# - `sudo mkfs.vfat /dev/<drive_name>` - format a drive
# - `udiskie` will startup via i3 config
sudo pacman -S udisks2 udiskie

# -------------Accessing the clipboard in Neovim----------------
sudo pacman -S xclip

# -----------------LightDM Webkit2 Greeter----------------------
sudo pacman -S lightdm-webkit2-greeter

# ----------------------More Software----------------------
sudo pacman -S gimp inkscape fontforge libreoffice-fresh

# ------------------AUR:Nerd Fonts Jet Brains-------------------
cd $HOME/Downloads/
git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono-160.git
cd ./nerd-fonts-jetbrains-mono-160/
makepkg
sudo pacman -U nerd-fonts-jetbrains-mono*.tar.zst
cd $HOME

# ------------------------AUR:Online----------------------------
cd $HOME/Downloads/
git clone https://aur.archlinux.org/brave-bin.git
cd ./brave-bin/
makepkg
sudo pacman -U brave-bin*.tar.zst
cd ../zoom/
makepkg
sudo pacman -U zoom*.tar.zst
cd $HOME

# ------------------------Neovim Config------------------------
cd $HOME/projects/
mkdir kickstart.nvim
cd kickstart.nvim
git clone --bare https://github.com/ge3224/kickstart.nvim.git bare.git
cd bare.git
git worktree add ../main
cd ..
ln -s ./main $HOME/.config/nvim
cd $HOME

# ---------------------Setup Configuration---------------------
cd $HOME/Projects/dotfiles/bijiben/
ln -s ./i3/ $HOME/.config/i3
ln -s ./i3status/ $HOME/.config/i3status
ln -s ./kitty/ $HOME/.config/kitty
sudo cp -r ./backgrounds/* /usr/share/backgrounds/
sudo cp -r ./pixmaps/* /usr/share/pixmaps/
sudo cp -r ./lightdm/* /etc/lightdm/
cd $HOME
