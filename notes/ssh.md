# SSH Key setup

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
