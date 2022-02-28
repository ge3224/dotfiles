#
# $HOME/.bashrc
#

eval "$(ssh-agent -s)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

# Launch Telegram from the shell
export PATH="$PATH:$HOME/Tools/Telegram"

# Android Emulator
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/go/bin"
# export PATH="$PATH:$HOME/Tools/flutter/bin"
# export PATH="$PATH:$HOME/Tools/android-studio/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

# ruby gem bin
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

# Multi-lingual input
#export GTK_IM_MODULE='fcitx'
#export QT_IM_MODULE='fcitx'
#export SDL_IM_MODULE='fcitx'
#export XMODIFIERS='@im=fcitx'

export PATH="$PATH:$HOME/Tools/FreeCAD_0.19.3-Linux-Conda_glibc2.12-x86_64.AppImage"

# Python pip
alias pip='pip3.9'

# Lua language server
# alias luamake=/home/ge/Tools/lua-language-server/3rd/luamake/luamake

# If there are multiple matches for completion, Tab should cycle through them

bind 'TAB':menu-complete

# Display a list of the matching files

bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press

bind "set menu-complete-display-prefix on"

bind '"\e[Z":menu-complete-backward'

alias nc='neocities'

alias pr='cd $HOME/Projects/'
alias pf='cd $HOME/Projects/pf-engineering/'
alias jg='cd $HOME/Projects/jgraphic/'
alias usb='cd $HOME/USB/portable'
. "$HOME/.cargo/env"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
