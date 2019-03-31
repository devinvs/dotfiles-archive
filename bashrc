#
# ~/.bashrc
#
if [ -f /etc/bash_completion ]; then
    /etc/bash_completion
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/devin/bin"
export __GL_YIELD="USLEEP"

alias grip="grep -i"
alias psgrep="ps -e | grep -i"
alias cp="cp -r"