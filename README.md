# Dotfiles for bijiben -- Arch Installation and Setup with Ansible

- [Laptops](https://wiki.archlinux.org/title/Laptop)
- [Thinkpads](https://wiki.archlinux.org/title/Laptop/Lenovo)

## TODOS

- [x] Fix icons in LightDM Greeter
- [ ] Configure power management
- [x] Configure display brightness controls (i3)
- [x] Setup [SSH Key/Keyring](https://wiki.archlinux.org/title/SSH_keys#SSH_agents) for [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [x] Email client
- [x] Install Rust
- [x] Install Golang
- [x] Install nodejs
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

## Misc Configuration & Setup

### Change Fn & (Left) Ctrl keys

- Enter Bios setup: Config > Keyboard/Mouse > Fn and Ctrl Key Swap

### Ansible Arch Setup

#### Install Ansible

```
sudo pacman -S ansible
```

#### Running a Playbook

```
cd <project_folder>/ansible/roles
ansible-playbook -K main.yml
```

Ref:

* [Example](https://github.com/linuxpiper/ansible-arch-setup)
* [Video](https://www.youtube.com/watch?v=H0cpE1Q_9N0)

### Formatting USB stick

- `lsblk` or use `df`
- `sudo umount /dev/sdb1`
- `sudo mkfs.vfat -F 32 /dev/sdb1`
- Or use `sudo mkfs.vfat -F 32 -n 'name_for_your_pendrive' /dev/sdb1`

### SSH Key setup

Ansible will install `openssh`, `keychain` and create location to store keys. To complete the setup do the following:

1. Generate a key:

```
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Configure Keychain to manage ssh agent in `~/.bashrc`

```
$ eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.keys/my_custom_key)
```

Ref:

- [Arch Wiki - SSH Keys](https://wiki.archlinux.org/title/SSH_keys)
- [Github Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Installing nodejs via pacman 

```
sudo pacman -Sy nodejs
sudo pacman -Sy npm
```
