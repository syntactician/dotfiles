# core utils
alias ls='ls -C --color'

# editing
alias edit="$EDITOR"

alias e="emacs"
alias ec="emacsclient"

alias vim='nvim'
alias v='vim'

# .config aliases
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'

# mutt
alias mutt='mutt -F $XDG_CONFIG_HOME/mutt/muttrc'
# offline mutt
alias muff='mutt -F $XDG_CONFIG_HOME/mutt/offline.muttrc'
alias offlineimap='offlineimap -c $XDG_CONFIG_HOME/mutt/offlineimaprc'

# task management
alias t='python  ~/.build/t/t.py --task-dir ~/.tasks --list tasks'

# screenshots
alias nfetch='neofetch \
	--disable theme gtk2 gtk3 icons \
	--uptime_shorthand tiny'

# config editing aliases
alias emacsrc="edit $XDG_CONFIG_HOME/emacs/init.el"
alias muttrc="edit $XDG_CONFIG_HOME/muttrc"
alias vimrc="edit $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="edit $XDG_CONFIG_HOME/zsh/.zshrc"

# alias reload=". $ZDOTDIR/.zshrc"
if [ $SHELL = "zsh" ]; then
	alias reload=". $ZDOTDIR/.zshrc"
elif [ $SHELL = "bash" ]; then
	alias reload=". $XDG_CONFIG_HOME/sh/bashrc"
else
	alias reload=". $XDG_CONFIG_HOME/sh/profile"
fi

# my scripts
alias howlong="$ZDOTDIR/scripts/countdown"
alias topdf="$ZDOTDIR/scripts/topdf.sh"
