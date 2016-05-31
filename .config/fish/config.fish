# Environment #
if status --is-login
  set -x PATH (ruby -e 'print Gem.user_dir') $HOME/.local/bin $PATH
end
set -x GOPATH $HOME/Documents/Go

# Plugins #
set -U Z_DATA $XDG_DATA_HOME/z

# Configuration for only login shells.
if status --is-login
  env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source
end

# Configuration for only interactive shells.
if status --is-interactive
  eval (dircolors -c $HOME/.dircolors | sed 's/>&\/dev\/null$//')

  # Set default editor.
  set -x VISUAL nvim
  set -x EDITOR $VISUAL
  set -x SUDO_EDITOR $VISUAL

  # Disable greeting.
  set fish_greeting

  # Aliases #
  alias ls 'ls --color=auto'

  if which ncmpcpp > /dev/null
    alias ncmpcpp "ncmpcpp -c $XDG_CONFIG_HOME/ncmpcpp/config"
  end

  if which $VISUAL > /dev/null
    alias edit 'eval $EDITOR'
  end

  # Use the Hub Git wrapper.
  if which git > /dev/null; and which hub > /dev/null
    alias git hub
  end

  # Pretty Git log command.
  if which git > /dev/null
    alias gpl 'git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
  end
end
