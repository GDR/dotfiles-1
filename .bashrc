#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ ! -d "$XDG_DATA_HOME/bash" ]; then
    mkdir "$XDG_DATA_HOME/bash"
fi
export HISTFILE="$XDG_DATA_HOME/bash/history"

source "$HOME/.bash_prompt"

export VISUAL=nvim
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
alias edit='eval "$VISUAL"'
