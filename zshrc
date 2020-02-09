# Created by newuser for 5.7.1
autoload -U promptinit; promptinit
autoload -Uz compinit; compinit
# Exports
export PATH="$PATH:/home/devin/bin:/home/devin/.local/bin"
export __GL_YIELD="USLEEP"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export OPENCV_LOG_LEVEL=ERROR

# User aliases
alias psgrep="ps -e | grep -i"
alias ls="ls --color=auto"

prompt pure
