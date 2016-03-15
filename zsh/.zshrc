# autoload -U promptinit && promptinit
# prompt off
PROMPT='] '
RPROMPT="%~"

# ls and cd stuff
alias ls='ls -C --color'
setopt autocd
function chpwd() {
	emulate -L zsh
	ls -C --color
}

# sudo
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
	# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

#
bindkey -v

# environmentals
export EDITOR='nvim'
export TERM='xterm'

# universal aliases
alias v='nvim'
alias vim='nvim'
alias mutt='mutt -F ~/.config/mutt/muttrc'
alias t='python2 ~/.build/t/t.py --task-dir ~/.tasks --list tasks'
