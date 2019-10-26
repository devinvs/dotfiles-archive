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

export PATH="$PATH:/home/devin/bin/:/opt/mssql-tools/bin:/home/devin/.local/bin"
export __GL_YIELD="USLEEP"
export QT_AUTO_SCREEN_SCALE_FACTOR=1

#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools

alias grip="grep -i"
alias psgrep="ps -e | grep -i"
alias cp="cp -r"

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="<${VIRTUAL_ENV##*/}>"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/devin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/devin/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/devin/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/devin/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

PS1="\e[m [\u@\h \W]\$ ";
