#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=4000

export EDITOR="vim"


complete -cf sudo


#alias grep='GREP_COLOR="1;31" grep --color '   pre vlastnu farbu


alias grep='grep --color'
alias egrep='egrep --color'

alias ssh='TERM=xterm ssh '


alias ls='ls --color=auto'
alias pacman='pacman --color always'
alias sudo='sudo '
alias youtube-viewer='youtube-viewer -C'
alias less='less -r'	#raw colors accepts

LS_COLORS=$LS_COLORS:'ow=0;35:' #35
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
alias s='speed-test'
alias w='curl wttr.in/Prague'

alias mutt='OLD_path=`pwd`; cd ~/Downloads; mutt; cd $OLD_path'

alias ..='cd ..'

#alias weechat='TERM=tmux-256color weechat'
alias wireshark-gtk'=sudo -g wireshark wireshark-gtk '
alias diff='diff --color=always '
alias less='less -R '

alias r=ranger
alias m=mutt

