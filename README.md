# [Arch Linux](https://wiki.archlinux.org/) Configuration

Arch Linux is a minimum base system, configured by the user to add only was is purposely
required. Attractive features include:

- You build your system yourself. You choose what components are installed, no
  bloat. There are no services running in the background that you are not aware
  of.
- Arch's package manager, [`pacman`](https://wiki.archlinux.org/title/Pacman),
  is easy to use and very well supported.
- Software availability is unrivaled. Besides the very extensive software
  options available through Arch's official repos, there is also the [Arch User
  Repository (AUR)](https://wiki.archlinux.org/title/Arch_User_Repository).
- The [Arch Wiki](https://wiki.archlinux.org/) is an incredible resource.
- Rolling release means no upgrade from version to version. Although less
  stable than a static release model, the rolling release is ideal for a
  desktop workstation because it provides access to to the latest software
  releases.

## Pacman Cheat Sheet

- `$ sudo pacman -Syu`                  Upgrade system
- `$ sudo pacman -S [package name]`     install package
- `$ sudo pacman -Rs [package name]`    remove a package and any unneeded dependencies
- `$ sudo pacman -Ss [package name]`    Queries a package remote repo
- `$ sudo pacman -Qs [package name]`    Queries a package installed locally
- `$ sudo pacman -Qet`                  List all explicitly installed packages
- `$ sudo pacman -Qdt`                  Lists any "orphaned packages"
- `$ pacman -Qtdq | sudo pacman -Rns -` Remove orphaned packages

### Paru AUR helper

Paru is an AUR helper that automates tasks, such as searching for AUR packages,
resolving dependencies, retrieving and building packages, retrieving web
content and user comments, and submitting personal packages to the AUR.

## i3 [Cheat Sheet](https://i3wm.org/docs/refcard.html):

`$ mod` = windows key

- `$ mod <CR>` open a terminal.
- `$ mod <number>` go to workspace
- `$ mod shift <number>` move active window to specified workspace
- `$ mod shift q` close the active window
- `$ mod d` open application laucher (dmenu)
- `$ mod shift space` toggle floating

## What is the difference between Linux and BSD?

Linux and BSD are both Unix-like operating systems, but they have different lineages.

Unix was created in 1969 at AT&T's Bell Labs. Due to an earlier antitrust case,
AT&T was forbidden from entering the computer business and was required to
license the Unix's source code to anyone who asked for it. This led to a
variety of academic and commercial variants.

Then, in 1984, AT&T divested itself of Bell Labs, and Unix could then be sold
by Bell Labs as a proprietary product. Users were no longer legally allowed to
modify Unix.

During the next few years, efforts were made by various developers to create a
free Unix-like software system. Two of these initiatives were 386BSD, a
descendant of the Berkley Software Distribution, and Linus Torvalds' Linux.
Linux was released on Sept. 17, 1991. 386BSD predated Linux but was not
released until 1992, due to legal complications. Torvalds has reportedly stated
that if 386BSD had been available at the time, he probably would not have
created Linux.
