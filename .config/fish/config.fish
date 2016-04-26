# Environment #
if status --login
  set -x PATH (ruby -e 'print Gem.user_dir') $HOME/.local/bin $PATH
end
set -x GOPATH $HOME/Documents/Go

# XDG BaseDir
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

set -x GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -x CCACHE_DIR $XDG_CACHE_HOME/ccache
set -x PYENV_ROOT $XDG_DATA_HOME/pyenv
set -x RBENV_ROOT $XDG_DATA_HOME/rbenv
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie
set -x IPYTHONDIR $XDG_CONFIG_HOME/ipython
set -x JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
if which tmux > /dev/null and not test -d $XDG_RUNTIME_DIR/tmux
  mkdir $XDG_RUNTIME_DIR/tmux
end
set -x TMUX_TMPDIR $XDG_RUNTIME_DIR/tmux
set -x STACK_ROOT $XDG_CONFIG_HOME/stack
set -x WEECHAT_HOME $XDG_CONFIG_HOME/weechat
if not test -d $XDG_CACHE_HOME/nv
  mkdir $XDG_CACHE_HOME/nv
end
set -x __GL_SHADER_DISK_CACHE_PATH $XDG_CACHE_HOME/nv
set -x CUDA_CACHE_PATH $XDG_CACHE_HOME/nv

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

  # Functions #
  function tmux
    if test $argv[1]
      /usr/bin/tmux $argv -f $XDG_CONFIG_HOME/tmux/tmux.conf
    else
      /usr/bin/tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf new-session -A -s main
    end
  end
end
