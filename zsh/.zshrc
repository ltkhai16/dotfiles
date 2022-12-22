## ALIAS
# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su poweroff reboot; do
	alias $command="sudo $command"
done; unset command

se() { cd ~/.local/bin; $EDITOR $(fzf) ;}

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best -o '~/Music/%(title)s.%(ext)s'" \

# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	egrep="egrep --color=auto" \
	pgrep="pgrep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto" \

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	sdn="shutdown now" \
	df="df -h" \
	free="free -m" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" \
	za="zathura" \
	nf="neofetch" \
	lf="lfub" \
	sxiv="nsxiv" \
	py="python" \
	cl="clear" \
 	jctl="sudo journalctl -p 3 -xb" \
 	cks="jctl && sudo dmesg | grep error && sudo systemctl --failed" \
	myip="curl http://ipecho.net/plain; echo" \
	btr="upower -i `upower -e | grep 'BAT'`" \
	# pkgfile --update

# Replacement ls
alias \
	l="exa -FG --color=automatic --group-directories-first" \
	ll="exa -Fl --color=automatic --group-directories-first --icons --git" \
 	la="l -a" \
 	lla="ll -a" \
 	lt="tree -C --dirsfirst -L" \

# Merge Xresources
alias merge="xrdb -merge ~/.Xresources"

# Pacman and Yay
alias \
  pi="p -S --needed" \
  yi="yay -S --needed" \
	bpkg="p -Slq | fzf --preview 'pacman -Si {}' --layout=reverse" \
  cu="p -Qqd | p -Rsu - && p -Sc --noconfirm && yay -Sc --aur --noconfirm && paccache -ruk0" \

# Edit config file
alias \
  tc="nvim ~/.config/alacritty/alacritty.yml" \
  zc="nvim $ZDOTDIR/.zshrc" \
  sz="source $ZDOTDIR/.zshrc" \
  lfc="nvim $XDG_CONFIG_HOME/lf/lfrc" \
  zac="nvim $XDG_CONFIG_HOME/zathura/zathurarc" \
  vimc="nvim $XDG_CONFIG_HOME/nvim/lua/base.lua" \
  mc="sudo -e /etc/pacman.d/mirrorlist" \

# Git command
alias \
	gcl="git clone" \
	gs="git status" \
	ga="git add" \
	gp="git push" \
	gpo="git push origin" \
	gtd="git tag --delete" \
	gtdr='git tag --delete origin' \
	gr='git branch -r' \
	gplo='git pull origin' \
	gb='git branch' \
	gc='git commit' \
	gd='git diff' \
	gco='git checkout' \
	gl='git log' \
	gr='git remote' \
	grs='git remote show' \

## CONFIGURATION
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\''*.tags'\'' -printf '\''%P\n'\'

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..|pacman|p|yay|cl)"

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

source $ZDOTDIR/completion.zsh
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
