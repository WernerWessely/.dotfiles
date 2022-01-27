# Profile for the ol powershell there
# Copy to ~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
# starship.toml goes under ~/.config
#
# Requirements for this shit to work:
# - Windows Terminal App (not strictly but looks best)
# - A nerd font (e.g. fira code)
# - Powershell 7
# - starship prompt
# - PSFzf (and fzf)

Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Shift+Tab -Function AcceptSuggestion

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -PSReadlineChordSetLocation 'Ctrl+f'

function powershell {
    pwsh -NoLogo
}

Remove-Alias rmrf -ErrorAction SilentlyContinue
function rmrf {
    Remove-Item -Recurse -Force $args
}

function .. {
    cd ..
}

function cdp {
    cd $(git rev-parse --show-toplevel)
}

function la {
    Get-ChildItem -Force $args
}

Remove-Alias g -Force -ErrorAction SilentlyContinue
function g {
    git $args
}

Remove-Alias gs -Force -ErrorAction SilentlyContinue
function gs {
    git status $args
}

Remove-Alias gl -Force -ErrorAction SilentlyContinue
function gl {
    git log --all --decorate --abbrev-commit --graph --format=format:'%C(auto)%h - %d %s %C(reset)%C(dim white) %an (%ar)' $args
}

Remove-Alias gd -Force -ErrorAction SilentlyContinue
function gd {
    git diff $args
}

Remove-Alias gds -Force -ErrorAction SilentlyContinue
function gds {
    git diff --staged $args
}

Remove-Alias ga -Force -ErrorAction SilentlyContinue
function ga {
    git add $args
}

Remove-Alias gc -Force -ErrorAction SilentlyContinue
function gc {
    git commit $args
}

Remove-Alias gp -Force -ErrorAction SilentlyContinue
function gp {
    git push $args
}

Remove-Alias gb -Force -ErrorAction SilentlyContinue
function gbc {
    git switch -c $args
}

function gbs {
    git switch $args
}

Remove-Alias gbd -Force -ErrorAction SilentlyContinue
function gbd {
    git branch -D $args
}

Remove-Alias gbm -Force -ErrorAction SilentlyContinue
function gbm {
    git branch -M $args
}

Remove-Alias dc -Force -ErrorAction SilentlyContinue
function dc {
    docker-compose $args
}

Invoke-Expression (&starship init powershell)
