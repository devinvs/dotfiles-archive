autoload -U promptinit; promptinit
autoload -Uz compinit; compinit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Exports
export PATH="$PATH:/home/devin/bin:/home/devin/.local/bin:/home/devin/.yarn/bin:/home/devin/.cargo/bin"

# User aliases
alias psgrep="ps -e | rg -i"
alias ls="ls --color=auto"
alias ssh="TERM=xterm ssh"
alias yeet="yay -Rns"
alias sway="sway --my-next-gpu-wont-be-nvidia > ~/sway.log"
alias wine-eac="/home/devin/wine-eac/usr/local/bin/wine"
alias vim="nvim"

function cd_with_fzf {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 2
}

zle -N cd_with_fzf{,}

bindkey "^f" cd_with_fzf

eval "$(starship init zsh)"
