## Multi-lingual Input

Install appropriate fonts, e.g. asian fonts:

- `$ sudo pacman -S ttf-freefont, ttf-arphic-uming, ttf-baekmuk`

Install input-method framework and input-method engine

- `$ sudo pacman -S fcitx-im fcitx-configtool`
- `$ sudo pacman -S fcitx-googlepinyin` <- Example input-method engine, one Chinese option

Add to PATH (`~/.xinitrc`)

```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

- [ ] TODO https://www.youtube.com/watch?v=lJoXhS4EUJs&t=432s

Generate locale 

- `$ sudo locale-gen`

Uncomment the specified language locale (`/etc/locale.gen`)

REF:

- https://bbs.archlinux.org/viewtopic.php?id=184640
- https://www.youtube.com/watch?v=lJoXhS4EUJs
- https://wiki.archlinux.org/title/Fcitx
