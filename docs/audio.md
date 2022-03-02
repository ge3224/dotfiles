# [ALSA](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture)

## Cheatsheat

```
$ amixer sset Master unmute
$ amixer set Master 5%+
$ amixer set Master 5%-
$ amixer set Master toggle
```

## Enable Audio

### Setting up device

[Alsa docs](https://alsa-project.org/wiki/Setting_the_default_device) show how to find sound cards with:

`$ cat /proc/asound/cards`

Create a config file: `/etc/asound.conf`
Add to it the following:

```
defaults.pcm.card [number]
defaults.ctl.card [number]
```

System is muted by default. Install alsa-utils and make sure user is part of the audio group.

```
$ sudo pacman -S alsa-utils
$ sudo gpasswd -a [user name] audio
$ speaker-test -c2
```

Check your user has been granted audio priviledge.

```
$ groups [user name]
```

# Note: 

	NOTE: HP 2000 laptop:
	00:01.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Wrestler HDMI Audio
	00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD] FCH Azalia Controller (rev 01)
