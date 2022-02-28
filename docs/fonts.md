#### [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur)

Overview:

Working with fonts in the [command line](https://www.youtube.com/watch?v=rLZk7cWbycI) is relatively straight forward.

- Check for fonts installed system wide: `$ ls -la /usr/share/fonts`.
- Save new fonts in `/usr/share/fonts`; subdirectories are ok.
- Install by running: `$ sudo fc-cache -fv`
- Install `imagemagick` and preview a font by `display [font filepath]` 

Install NF manually, rather than using the AUR option, which resulted in poor rendering in Alacritty.
