# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/
alias dotfiles="'/usr/bin/git' --git-dir=$HOME/dotfiles --work-tree=$HOME"
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cicio/.zshrc'

autoload -Uz compinit
compinit

# alias mars="java -jar /home/cicio/Downloads/Mars4_5.jar"
# ZSH_THEME=robbyrussel
PS1='%B%F{240}%2~%f%b '
# PS1='%/ $ ' # david@macbook /tmp $
# End of lines added by compinstall
