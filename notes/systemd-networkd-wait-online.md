# systemd-netword-wait-online

- By default the service waits for *ALL* links managed by systemd-networkd to be fully configured or failed. For systems with multiple network interfaces that are not expected to be connecte all the time, systemd-networkd-wait-online.service will fail. See [Systemd-networkd](https://wiki.archlinux.org/title/Systemd-networkd) for fix.
