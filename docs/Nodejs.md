### NodeJS & npm

- `$ sudo pacman -S nodejs` 

If a simple `$ sudo pacman -S nodejs` does not work, it is likely due to nodejs's reliance on so many ephemeral dependencies. I was able to get it installed and in turn get [yarn](#yarn) installed by doing the following:

```
$ sudo pacman -Rsc -n nodejs
$ sudo pacman -Sy nodejs
$ sudo pacman -Sy npm
```

