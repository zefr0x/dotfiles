# Shared environment variables to be sourced in .bashrc and .zshrc
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Use XDG base dirs
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export MYPY_CACHE_DIR="$XDG_CACHE_HOME/mypy"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# XDG base dirs aliases
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias monerod=monerod --data-dir "$XDG_DATA_HOME/bitmonero"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"

# Variables depending on the session or the desktop type.
# if [[ "$XDG_SESSION_DESKTOP" == "KDE"  ]]
# then
#     export GTK_USE_PORTAL=1
# fi
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
	export MOZ_ENABLE_WAYLAND=1
fi
