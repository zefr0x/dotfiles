# Shared environment variables to be sourced in the login shell.
# Every shell should inherit those vars.

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Tell shh where is the ssh-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# Tell docker to use the user's socket, not the root
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Use XDG base dirs
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export MYPY_CACHE_DIR="$XDG_CACHE_HOME/mypy"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME"/nvm
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ANDROID_HOME="$XDG_DATA_HOME"/android

# Variables depending on the session or the desktop type
# export GTK_USE_PORTAL=1
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export MOZ_ENABLE_WAYLAND=1
fi
