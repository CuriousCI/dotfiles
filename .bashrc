# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -l'
alias dotfiles="'/usr/bin/git' --git-dir=$HOME/dotfiles --work-tree=$HOME"
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
