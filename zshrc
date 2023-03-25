#!/bin/sh
# My zsh config. Not much to see, just for my personal.
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs
export \
  EDITOR="nvim" \
  VISUAL="nvim" \
  BROWSER="firefox" \
  CHROME_EXECUTABLE="chromium" \

# Other program settings
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
# ~/ Clean-up
export \
  XDG_CONFIG_HOME="$HOME/.config" \
  XDG_DATA_HOME="$HOME/.local/share" \
  XDG_CACHE_HOME="$HOME/.cache" \
  ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" \

export PATH="$PATH:$HOME/dev/flutter/bin"

autoload -U colors && colors

setopt autocd
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zhistory"

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

eval "$(starship init zsh)"
