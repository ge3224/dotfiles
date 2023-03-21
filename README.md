# Dotfiles for bijiben -- Arch Installation and Setup with Ansible

- [Laptops](https://wiki.archlinux.org/title/Laptop)
- [Thinkpads](https://wiki.archlinux.org/title/Laptop/Lenovo)

## TODOS

- [x] Fix icons in LightDM Greeter
- [ ] Configure power management
- [x] Configure display brightness controls (i3)
- [ ] Setup SSH and Keyring
- [ ] Email notifier
- [ ] Install Rust
- [ ] Install Golang
- [ ] Virtual Box and Windows 10
- [ ] Zsh

## Installing Arch

### [Changing Terminal Fonts](https://wiki.archlinux.org/title/Linux_console#Fonts)

```
sudo pacman -S terminus-font
setfont ter-132n
```

### iwctl Cheatsheet

```
# iwctl
[iwd]# device list
[iwd]# station <device> scan
[iwd]# station <device> get-networks
[iwd]# station <device> connect <SSID>
```

### Misc Configuration

#### Swap Fn & (Left) Ctrl keys

- Enter Bios setup: Config > Keyboard/Mouse > Fn and Ctrl Key Swap

## Ansible Arch Setup

### Install Ansible

```
sudo pacman -S ansible
```

### Running a Playbook

```
cd <project_folder>/ansible/roles
ansible-playbook -K main.yml
```

Ref:

* [Example](https://github.com/linuxpiper/ansible-arch-setup)
* [Video](https://www.youtube.com/watch?v=H0cpE1Q_9N0)

Notes:
