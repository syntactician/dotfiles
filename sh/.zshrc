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

# ls and cd
setopt autocd
function chpwd() {
	emulate -L zsh
	ls -C --color
}

# Esc Esc = sudo current (or previous) line
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
# export EDITOR='nvim'
export EDITOR='emacsclient'

# source my files
. "$ZDOTDIR/git_prompt.zsh"
. "$ZDOTDIR/layouts.sh"
. "$ZDOTDIR/xdg.sh"
. "$ZDOTDIR/aliases.sh"
# . "$ZDOTDIR/scripts/countdown.sh"

$ZDOTDIR/scripts/countdown

export PATH=$GEM_HOME/bin:$HOME/.wm:$PATH

# source other stuff
SYNTAX='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
[[ -r $SYNTAX ]] && source $SYNTAX
Z='/usr/share/z/z.sh'
[[ -r $Z ]] && source $Z
