# Configuration notes

1. archinstall (Extra packages: git neovim kitty firefox base-devel)

## Adjust for [HiDPI](https://wiki.archlinux.org/title/HiDPI)

Ref: https://youtu.be/lhiLWxJgiAo

2. Install `xorg-xrdb` for Xresources
3. Create resource file: `~/.Xresources`
4. Load resource file: `xrdb ~/.Xresources`

## Swap Fn & (Left) Ctrl keys

5. Enter Bios setup: Config > Keyboard/Mouse > Fn and Ctrl Key Swap

## [Make CapsLock Key Esc](https://wiki.archlinux.org/Xmodmap)

6. Open the following file: `sudo nvim /etc/X11/xorg.conf.d/00-keyboard.conf`
7. Update Option: `Option "XkbOptions" "terminate:ctrl_alt_bksp,caps:escape_shifted_capslock"`

## Nerd Fonts

8. AUR Nerd Fonts; install package the ame way as any software package

## Accessing the clipboard in Neovim

9. install `xclip`

## LightDM

Ref: https://www.youtube.com/watch?v=_dYqisDIcC0 

10. Install `lightdm-webkit2-greeter`
11. Configure in 1: `/etc/lightdm/lightdm.conf` and `/etc/lightdm/lightdm-webkit2-greeter.conf` 

## [DMenu](https://wiki.archlinux.org/title/dmenu)

12. Tweak in i3 config

TODO:

- [x] Configure lightdm
- [x] Change font in DMenu
- [x] Tweak battery status
- [ ] Xorg initial display defaults or display script
- [ ] USB
- [ ] test camera / zoom
- [ ] access tokens for github and crates.io
- [ ] mail client or notifier
