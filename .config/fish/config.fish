# Base
set fish_greeting ""
set -gx TERM xterm-256color

# Ailases
alias ll='exa -bhgla --icons --git'
alias repos='cd $(ghq root)/$(ghq list | fzy)'


# Application initialization
# echo 'rtx activate fish | source'

if status is-interactive
    set -U FZF_LEGACY_KEYBINDINGS 0
    starship init fish | source
    # Commands to run in interactive sessions can go here
end
