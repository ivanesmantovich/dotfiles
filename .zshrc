# Colored prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/esmantovich/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
neofetch
task

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# fnm
export PATH=/home/esmantovich/.fnm:$PATH
eval "`fnm env`"
