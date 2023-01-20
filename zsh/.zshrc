#!/bin/sh
# My zsh config. Not much to see, just for my personal.

### EXPORT ###

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"
export CHROME_EXECUTABLE="brave"

# Other program settings:
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\''*.tags'\'' -printf '\''%P\n'\'

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

# Android-SDK
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

# ibus-bamboo
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'
export QT4_IM_MODULE='ibus'
export CLUTTER_IM_MODULE='ibus'

# QT file picker for GTK app
export GTK_USE_PORTAL=1

export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..|pacman|p|yay|cl)"
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

### CONFIGURATION ###

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS


up () {
  local d=""
  local limit="$1"

  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  if ! cd "$d"; then
    echo " Couldn't go up $limit dirs.";
  fi
}

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

eval "$(starship init zsh)"
