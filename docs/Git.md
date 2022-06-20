### git

# Git Work Trees

## Git Work Trees Cheat Sheet

```
git clone --bare <repo> <local name>
git worktree add <branch>
git worktree remove <branch>
```
REF: ~/scratch/prime_git_worktrees.mp4

#### [Configure git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

Cheat Sheet Configuration:

- `$ git config --list --show-origin` -- view all your settings
- `$ git config --global user.name "John Doe"` 
- `$ git config --global user.email johndoe@example.com`
- `$ git config --global core.editor nvim`

Starting ssh agent

- `$ eval "$(ssh-agent -s)"`

Start ssh-agent with systemd user

Create the following config file: `~/.config/systemd/user/ssh-agent.service` with this config: 

```
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

#### [Authentication](https://wiki.archlinux.org/title/Git#Using_git-credential-libsecret_as_credential-helper)

The wiki mentions two examples of org.freedesktop.secrets compatible keyrings, which are named 'gnome-keyring' and 'keepassxc' in the Arch repo. On the [wiki for KeepassXC](https://wiki.archlinux.org/title/KeePass#Secret_Service), however, it states that access to secrets is unavailable unless the application is running.

```
$ sudo pacman -S gnome-keyring libsecret seahorse
```

Without a display manager, i.e. LightDM, the keyring must be configured manually. 

Setting up gnome-keyring: Using the [PAM method](https://wiki.archlinux.org/title/GNOME/Keyring), three config files need to be modified:

1. Add to `etc/pam.d/login` the following two lines (indicated in bold):

```
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
**auth       optional     pam_gnome_keyring.so**
account    include      system-local-login
session    include      system-local-login
password   include      system-local-login
**session	optional	 pam_gnome_keyring.so  auto_start**
```

2. Add to `/etc/pam.d/passwd` the following line (indicated in bold):

```
#%PAM-1.0
#password	required	pam_cracklib.so difok=2 minlen=8 dcredit=2 ocredit=2 retry=3
#password	required	pam_unix.so sha512 shadow use_authtok
password	required	pam_unix.so sha512 shadow nullok
**password    optional    pam_gnome_keyring.so**
```

3. Add to `$HOME/.xinitrc` the following three lines:

```
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
```

Check keyring setup:

```
dbus-send --session --print-reply --dest=org.freedesktop.DBus / \
    org.freedesktop.DBus.GetConnectionUnixProcessID \
    string:org.freedesktop.secrets
```

Check if `libsecret` and `glib2` is installed. 

Afterward: 

`$ git config --global credential.helper /usr/lib/git-core/git-credential-libsecret`

Save passphrase in keyring: 

`$ /usr/lib/seahorse/ssh-askpass my_key`

REF: 

- [Github article](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
- [Credential Helper](https://wiki.archlinux.org/title/Git#Using_git-credential-libsecret_as_credential-helper)
- [Using Gnome Keyring](https://web.archive.org/web/20160326164641/https://gentoo-wiki.info/HOWTO_Use_gnome-keyring_to_store_SSH_passphrases)
- [WYSIWYG](https://www.youtube.com/watch?v=VcbtPW2FUj0)
