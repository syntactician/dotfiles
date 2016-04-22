# prompt off

autoload -U compinit && compinit
setopt completealiases
setopt HIST_IGNORE_DUPS

PROMPT='] '
# PROMPT='[$(t | wc -l | sed -e "s/ *//")] '
# this right prompt will be overrided
# by the git prompt sourced below
# this is a fallback
RPROMPT="%~"

# include wm in PATH
PATH=~/.wm/:$PATH:~/.gem/ruby/2.3.0/bin/

# ls and cd
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

# vim-keys
bindkey -v

# environmentals
export EDITOR='nvim'
# export EDITOR='emacsclient'

# universal aliases
alias edit="$EDITOR"
alias v='nvim'

# .config aliases
alias tmux='tmux -f ~/.config/tmux/tmux.conf'

alias muff='mutt -F $HOME/.mutt/offline.muttrc'
alias offlineimap='offlineimap -c $HOME/.mutt/offlineimaprc'

# alias vim='nvim'
alias t='python ~/.build/t/t.py --task-dir ~/.tasks --list tasks'
alias b='python ~/.build/t/t.py --task-dir ~/.tasks --list bugs'

alias nfetch='neofetch \
	--disable theme gtk2 gtk3 icons \
	--uptime_shorthand tiny'

# config editing aliases
alias emacsrc="edit ~/.emacs.d/init.el"
alias muttrc="edit ~/.mutt/muttrc"
alias vimrc="edit ~/.config/nvim/init.vim"
alias zshrc="edit ~/.config/zsh/zshrc"

# source external files
. ~/.config/zsh/git_prompt.zsh

SYNTAX='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
[[ -r $SYNTAX ]] && source $SYNTAX

Z='/usr/share/z/z.sh'
[[ -r $Z ]] && source $Z
