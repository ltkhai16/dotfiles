# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su poweroff reboot find; do
	alias $command="sudo $command"
done; unset command

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
	egrep="egrep --color=auto" \
	fgrep="fgrep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto" \

# These common commands are just too long! Abbreviate them.
alias \
	df="df -h" \
	free="free -hm" \
	e="$EDITOR" \
	p="pacman" \
	za="zathura" \
	py="python" \
	cl="clear" \
	cat="bat" \
	sxiv="nsxiv" \
  rg="ranger" \
 	jctl="sudo journalctl -p 3 -xb" \
 	cks="jctl && sudo dmesg | grep error && sudo systemctl --failed" \
	myip="curl http://ipecho.net/plain; echo" \
	btr="upower -i `upower -e | grep 'BAT'`" \
  sz="source ~/.zshrc" \
  merge="xrdb -merge ~/.Xresources" \
  lfont="kitty +list-fonts --psnames | grep" \
  sdn="shutdown now" \
	# pkgfile --update

# Replacement ls
alias \
	l="exa -FG --group-directories-first" \
	ll="exa -Fl --group-directories-first --icons" \
 	la="l -a" \
 	lla="ll -a" \
 	lt="exa -T" \

# Pacman and Yay
alias \
  pi="p -S --needed" \
  yi="yay -S --needed" \
  bpkg="p -Slq | fzf --preview 'pacman -Si {}' --layout=reverse" \
  cu="p -Sc --noconfirm && yay -Sc --aur --noconfirm && paccache -ruk0" \

# Edit config file
alias \
  ea="nvim $ZDOTDIR/aliases.zsh" \
  ez="nvim ~/.zshrc" \
  et="nvim ~/.config/alacritty/alacritty.yml" \
  ekt="nvim ~/.config/kitty/kitty.conf" \
  eza="nvim $XDG_CONFIG_HOME/zathura/zathurarc" \
  ev="nvim $XDG_CONFIG_HOME/nvim/lua/base.lua" \
  emr="sudo -e /etc/pacman.d/mirrorlist" \

# Grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

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
