# Zplug:
source ~/.zplug/init.zsh

# Manage zplug itself:
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins:
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "jeffreytse/zsh-vi-mode"

zplug load

# Autosuggestions config:
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

# Some aliases:
alias ls="ls --color"
alias l="ls -lFh"
alias la="ls -lAFh"
alias ..="cd .."
alias g="git"
alias gs="git status"
alias gl="git log --all --decorate --abbrev-commit --graph \
    --format=format:'%C(auto)%h - %d %s %C(reset)%C(dim white) %an (%ar)'"
alias gd="git diff"
alias gds="git diff --staged"
alias gdh="git diff HEAD"
alias ga="git add"
alias gc="git commit"
alias bat="batcat"

# History settings:
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable starship prompt:
eval "$(starship init zsh)"

function my_bindings() {
    bindkey '^F' fzf-cd-widget
}

# fzf config:
FZF_CTRL_T_COMMAND="fdfind --type f --hidden --follow --exclude .git"
FZF_ALT_C_COMMAND="fdfind --type d --hidden --follow --exclude .git"

# Set all key bindings after vi mode init:
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
zvm_after_init_commands+=(my_bindings)

