# antigen-hs
source ~/.zsh/antigen-hs/init.zsh

# pure
autoload -U promptinit && promptinit
prompt pure

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
alias v='vim'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias i3rc="vim ~/.i3/config"
alias muttrc="vim ~/.muttrc"

# ubuntu aliases
alias sublime='/opt/sublime_text/sublime_text'
alias open='xdg-open &>/dev/null'
alias o='xdg-open &>/dev/null'
alias ag='sudo apt-get'            # age - but without sudo
alias aga='sudo apt-get autoclean' # aac
alias agb='sudo apt-get build-dep' # abd
alias agc='sudo apt-get clean'     # adc
alias agd='sudo apt-get dselect-upgrade' # ads
alias agi='sudo apt-get install'  # ai
alias agp='sudo apt-get purge'    # ap
alias agr='sudo apt-get remove'   # ar
alias agu='sudo apt-get update'   # ad
alias agud='sudo apt-get update && sudo apt-get dist-upgrade' #adu
alias agug='sudo apt-get upgrade' # ag
alias aguu='sudo apt-get update && sudo apt-get upgrade'      #adg

compdef _ag ag='sudo apt-get'
compdef _aga aga='sudo apt-get autoclean'
compdef _agb agb='sudo apt-get build-dep'
compdef _agc agc='sudo apt-get clean'
compdef _agd agd='sudo apt-get dselect-upgrade'
compdef _agi agi='sudo apt-get install'
compdef _agp agp='sudo apt-get purge'
compdef _agr agr='sudo apt-get remove'
compdef _agu agu='sudo apt-get update'
compdef _agud agud='sudo apt-get update && sudo apt-get dist-upgrade'
compdef _agug agug='sudo apt-get upgrade'
compdef _aguu aguu='sudo apt-get update && sudo apt-get upgrade'
