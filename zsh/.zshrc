# Zplug:
source ~/.zplug/init.zsh

# Manage zplug itself:
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins:
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "jeffreytse/zsh-vi-mode"
zplug "plugins/colored-man-pages", from:oh-my-zsh

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
alias gp="git push"
alias gbc="git switch -c"
alias gbs="git switch"
alias gbd="git branch -D"
alias gbm="git branch -M"
alias bat="batcat"
alias v="nvim \"+Telescope find_files hidden=true\""
alias vh="nvim \"+cd ~\" \"+Telescope find_files hidden=true\""
alias vim="nvim"
alias e="emacs -nw"
alias eg="emacs &!"
alias dc="docker-compose"
alias kc="kubectl"
alias mk="minikube"
alias cdp='cd $(git rev-parse --show-toplevel)'
alias t="tig --all"

# History settings:
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable starship prompt:
eval "$(starship init zsh)"

function my_bindings() {
    bindkey '^F' fzf-cd-widget
    bindkey '^[[Z' autosuggest-accept
}

# fzf config:
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow --no-ignore-vcs --exclude .git"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS="--preview 'batcat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND="fdfind --type d --hidden --follow --no-ignore-vcs --exclude .git"
export FZF_ALT_C_OPTS="--preview 'exa --color=always -l {}'"

# Set all key bindings after vi mode init:
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
zvm_after_init_commands+=(my_bindings)

# Add go to path:
export PATH=$PATH:/usr/local/go/bin:~/go/bin

# Add bob-managed neovim to path:
export PATH=$PATH:~/.local/share/neovim/bin

# Add ~/.local/bin to path just in case:
export PATH=$PATH:~/.local/bin
