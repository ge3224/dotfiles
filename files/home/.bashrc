#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load ble.sh for syntax highlighting (if installed)
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# Enhanced tab completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Programmable completion enhancements
if [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# Completion options
bind "set completion-ignore-case on"        # Case-insensitive completion
bind "set show-all-if-ambiguous on"         # Show all completions immediately
bind "set show-all-if-unmodified on"        # Show completions on first tab
bind "set menu-complete-display-prefix on"  # Show common prefix before cycling

# Enhanced command completion
complete -cf sudo                            # Complete commands and files after sudo

# Kanagawa-themed LS_COLORS
export LS_COLORS="di=38;2;126;156;216:ln=38;2;152;187;108:so=38;2;228;104;118:pi=38;2;230;195;132:ex=38;2;220;215;186:bd=38;2;149;127;184:cd=38;2;149;127;184:su=38;2;228;104;118:sg=38;2;228;104;118:tw=38;2;106;149;137:ow=38;2;106;149;137"

# Colorized ls output
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# History improvements
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:ignorespace:erasedups
shopt -s histappend

# Shell behavior improvements
shopt -s autocd          # cd into directory by typing name alone
shopt -s checkwinsize    # Update LINES and COLUMNS after each command
shopt -s cdspell         # Correct minor spelling errors in cd commands
shopt -s dirspell        # Correct minor spelling errors in directory names

# History search with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Kanagawa-themed prompt
# Shows: [user@host] /current/path $ 
PS1='\[\e[38;2;114;113;105m\][\[\e[38;2;126;156;216m\]\u\[\e[38;2;114;113;105m\]@\[\e[38;2;152;187;108m\]\h\[\e[38;2;114;113;105m\]] \[\e[38;2;230;195;132m\]\w\[\e[38;2;220;215;186m\] \$ \[\e[0m\]'

# Attach ble.sh (must be at end of .bashrc)
[[ ${BLE_VERSION-} ]] && ble-attach
