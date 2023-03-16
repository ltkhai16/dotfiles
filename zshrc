#!/bin/sh
# My zsh config. Not much to see, just for my personal.

### EXPORT ###

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs
export \
  EDITOR="nvim" \
  VISUAL="nvim" \
  BROWSER="firefox" \
  CHROME_EXECUTABLE="chromium" \

# Other program settings
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\''*.tags'\'' -printf '\''%P\n'\'

# ~/ Clean-up
export \
  XDG_CONFIG_HOME="$HOME/.config" \
  XDG_DATA_HOME="$HOME/.local/share" \
  XDG_CACHE_HOME="$HOME/.cache" \
  ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" \
  WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc" \

# Android-SDK

export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..|pacman|p|yay|cl)"

### CONFIGURATION ###

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

eval "$(starship init zsh)"
