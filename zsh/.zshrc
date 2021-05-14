# Zplug:
source ~/.zplug/init.zsh

# Manage zplug itself:
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins:
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load

# Autosuggestions config:

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

# Some aliases:
alias ls="ls --color"
alias l="ls -lFh"
alias la="ls -lAFh"
alias ..="cd .."
alias g="git"

# Enable starship prompt:
eval "$(starship init zsh)"

