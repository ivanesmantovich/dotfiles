autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'

alias vi="nvim"
alias vim="nvim"

alias ll="eza -al --group-directories-first"

PROMPT='%F{blue}%n%f on %m at %B%~%b${vcs_info_msg_0_}: '

eval "$(zoxide init zsh)"
