### Neovim

#### Clipboard

Nvim has no direct connection to the system clipboard. Instead it depends on a "provider" which transparently uses shell commands to communicate with the system clipboard or any other clipboard "backend".

```
$ sudo pacman -S xclip
```

#### [Nvimlinx](https://github.com/ge3224/nvimlinx)

I've saved my Neovim config in a separate [repo](https://github.com/ge3224/nvimlinx) with the idea of making it available for work on other Linux distributions.

#### Neovim Plugin Manager

```
$ git clone https://github.com/wbthomason/packer.nvim\
 [destination]/packer.nvim
$ sudo mkdir -p $HOME/.local/share/nvim/site/pack/packer/start/
$ ln -s [destination]/packer.nvim  $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
```

In Neovim, you can check if the `pack` direction is in the editor's runtimepath:

```
$ :echo &runtimepath
```

#### LSP-Config

See [nvimlinx repo](https://github.com/ge3224/nvimlinx#lsp). 

##### gopls

See [nvimlinx repo](https://github.com/ge3224/nvimlinx#gopls). 

##### dartls

See [nvimlinx repo](https://github.com/ge3224/nvimlinx#dartls). 

##### vimls

See [nvimlinx repo](https://github.com/ge3224/nvimlinx#vimls). 

##### lua

See [nvimlinx repo](https://github.com/ge3224/nvimlinx#lua). 

