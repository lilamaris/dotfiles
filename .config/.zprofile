export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx

typeset -U path PATH

path_prepend() {
  [[ -d "$1" ]] && path=("$1" "$path[@]")
}

path_append() {
  [[ -d "$1" ]] && path+=("$1")
}

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.pyenv/bin"
path_append "$HOME/.lmstudio/bin"

unfunction path_prepend path_append
