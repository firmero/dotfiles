
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=4000

export EDITOR="vim"


complete -cf sudo
complete -cf man


#alias grep='GREP_COLOR="1;31" grep --color '   pre vlastnu farbu


alias grep='grep --color'
alias egrep='egrep --color'

alias ssh='TERM=xterm ssh '


alias ls='ls --color=auto'
alias pacman='pacman --color always'
alias sudo='sudo '
alias youtube-viewer='youtube-viewer -C'
alias less='less -r'	#raw colors accepts


# other writable. dir. exe.
LS_COLORS=$LS_COLORS:'ow=0;35:di=1;34:ex=0;32:ln=1;36:'
export LS_COLORS

# shortening of paths displayed in prompts 
PROMPT_DIRTRIM=3

#PS1='[\u@\h \W]\$ ' default
PS1='\[\e[0;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$ \[\e[0;m\]'

#colored man
man() { 
    LESS_TERMCAP_md=$'\e[0;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[0;41;39m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[0;32m' \
    command man "$@"


}

alias l='ls -lhtr --color=auto'
alias u='~/upd.sh'
alias s='speed-test --verbose'
alias w='curl "wttr.in/Praha?M?0&lang=sk"'
alias ww='curl "wttr.in/Praha?M?1&lang=sk"'
alias www='curl "wttr.in/Praha?M&lang=sk"'


alias mutt='OLD_path=`pwd`; cd ~/Downloads; mutt; cd $OLD_path'

alias ..='cd ..'

#alias weechat='TERM=tmux-256color weechat'
alias wireshark-gtk'=sudo -g wireshark wireshark-gtk '
alias diff='diff --color=always '
alias less='less -R '

alias r=ranger
alias m=mutt


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')


alias octave='octave-cli'
alias kinit='kinit TODO prihlasovacie meno'

# disable Software Flow Control (XON/XOFF flow control)
stty -ixon

