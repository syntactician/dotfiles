# pure
autoload -U promptinit && promptinit
prompt off
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

# environmentals
export EDITOR='vim'
export TERM='xterm'

# universal aliases
alias v='nvim'
alias vim='nvim'
