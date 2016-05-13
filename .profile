[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

PATH="$(ruby -e 'print Gem.user_dir'):$HOME/.local/bin:$PATH"
export PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPATH="$HOME/Documents/Go"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

if [ ! -d "$XDG_DATA_HOME/bash" ]; then
  mkdir "$XDG_DATA_HOME/bash"
fi
export HISTFILE="$XDG_DATA_HOME/bash/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
if [ ! -d "$XDG_RUNTIME_DIR/tmux" ]; then
  mkdir "$XDG_RUNTIME_DIR/tmux"
fi
export TMUX_TMPDIR="$XDG_RUNTIME_DIR/tmux"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export WINEPREFIX="$XDG_DATA_HOME/wine/prefixes/default"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR/tmux"
export RUST_SRC_PATH="$HOME/.local/src/rust/src"

# NVIDIA Linux Driver
if [ ! -d "$XDG_CACHE_HOME/nv" ]; then
  mkdir "$XDG_CACHE_HOME/nv"
fi
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
