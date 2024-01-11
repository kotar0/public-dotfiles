# Base
set fish_greeting ""
# set -gx TERM xterm-256color

# Ailases
alias ll='eza -bhgla --icons --git'
alias repos='cd $(ghq root)/$(ghq list | fzy)'
alias n='nvim .'
alias c='code .'
alias gui=gitui
alias cmc=pbcopy

# Application initialization
fish_add_path /opt/homebrew/bin #brew
mise activate fish | source #rtx
export XDG_CONFIG_HOME="$HOME/.config" #set .config dir for several apps

if status is-interactive
    set -U FZF_LEGACY_KEYBINDINGS 0
    starship init fish | source
    # Commands to run in interactive sessions can go here
end
