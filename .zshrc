autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zhistory"

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f 'ba' -o '~/Music/%(title)s.%(ext)s'" \

# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ip="ip -color=auto" \

# These common commands are just too long! Abbreviate them.
alias \
	df="df -h" \
	free="free -hm" \
	svi="sudo -E nvim" \
	cks="sudo dmesg | grep error && sudo systemctl --failed && sudo journalctl --no-pager -p 3 -xb" \

# Replacement ls
alias \
	ls='exa -g --git --group-directories-first' \
	ll='exa -alg --header --git --group-directories-first' \

# Git command
alias \
	gcl="git clone" \
	gs="git status" \
	ga="git add" \
	gp="git push" \

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

