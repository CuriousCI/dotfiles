HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/sandbox/smlnj/bin:$HOME/projects/vdmj-suite-4.6.0/

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

alias ls='ls --color'
alias dir='dir --color'
alias vdir='vdir --color'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias dotfiles="'/usr/bin/git' --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias t="tmux -2"
alias tn="t new -t"
alias tls="t ls"
alias ta="t a -t"

export LESS_TERMCAP_mb=$'\E[33m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[00m'
export LESS_TERMCAP_ms=$'\E[07m'
export LESS_TERMCAP_us=$'\E[04;32m'
export LESS_TERMCAP_ue=$'\E[00m'
export LESS_COLORIZED=1

export CGO_ENABLED=1

bindkey -v
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^d ". dir-navigator\n"

PS1=$'%B%F{yellow}%2~%f%b '

eval "$(fzf --zsh)"
