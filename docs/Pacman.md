### Pacman Cliff Notes:

- `$ sudo pacman -Syu`                  Upgrade system
- `$ sudo pacman -S [package name]`     install package
- `$ sudo pacman -Rs [package name]`    remove a package and any unneeded dependencies
- `$ sudo pacman -Ss [package name]`    Queries a package remote repo
- `$ sudo pacman -Qs [package name]`    Queries a package installed locally
- `$ sudo pacman -Qet`                  List all explicitly installed packages
- `$ sudo pacman -Qdt`                  Lists any "orphaned packages"
- `$ pacman -Qtdq | sudo pacman -Rns -` Remove orphaned packages
