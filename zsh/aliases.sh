alias ls='ls -C --color'

alias edit="$EDITOR"
alias vim='nvim'
alias v='vim'


# .config aliases
alias tmux='tmux -f ~/.config/tmux/tmux.conf'

# mutt
alias mutt='mutt -F $HOME/.config/mutt/muttrc'
# offline mutt
alias muff='mutt -F $HOME/.config/mutt/offline.muttrc'
alias offlineimap='offlineimap -c $HOME/.config/mutt/offlineimaprc'

alias  t='python  ~/.build/t/t.py --task-dir ~/.tasks --list tasks'
alias t2='python2 ~/.build/t/t.py --task-dir ~/.tasks --list tasks'
alias t3='python3 ~/.build/t/t.py --task-dir ~/.tasks --list tasks'
alias b='python ~/.build/t/t.py --task-dir ~/.tasks --list bugs'

alias nfetch='neofetch \
	--disable theme gtk2 gtk3 icons \
	--uptime_shorthand tiny'

# config editing aliases
alias emacsrc="edit ~/.config/emacs/init.el"
alias muttrc="edit ~/.config/muttrc"
alias vimrc="edit ~/.config/nvim/init.vim"
alias zshrc="edit ~/.config/zsh/.zshrc"

alias howlong="$ZDOTDIR/countdown.sh"
