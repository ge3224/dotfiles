#!/bin/zsh

[[ $- != *i* ]] && return

PROMPT='(%n) %~ › '

export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.local/zsh_history

alias vim="nvim"

# Cargo environment
. "$HOME/.cargo/env"

# Go path configuration
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Pipx path
export PATH="$PATH:/home/ge/.local/bin"

# pnpm configuration
export PNPM_HOME="/home/ge/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Deno environment
. "/home/ge/.deno/env"
