#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "$HOME/.bash_prompt"

export VISUAL=nvim
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
alias edit='eval "$VISUAL"'
alias ls='ls --color=auto'

export GOPATH="$HOME/Documents/Go"
