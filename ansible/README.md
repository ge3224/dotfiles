# Arch Installation and Setup with Ansible

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

## Ansible Arch Setup

### Install Ansible

```
sudo pacman -S ansible
```

### Running a Playbook

```
ansible-playbook -K main.yml
```

Ref:

* [Example](https://github.com/linuxpiper/ansible-arch-setup)
* [Video](https://www.youtube.com/watch?v=H0cpE1Q_9N0)
