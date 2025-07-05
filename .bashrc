# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -l'
alias dotfiles="'/usr/bin/git' --git-dir=$HOME/dotfiles --work-tree=$HOME"
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export LESS_TERMCAP_mb=$'\E[33m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[00m'
export LESS_TERMCAP_ms=$'\E[07m'
export LESS_TERMCAP_us=$'\E[04;32m'
export LESS_TERMCAP_ue=$'\E[00m'
export LESS_COLORIZED=1
