# Lilamaris's dotfiles

[Korean](README.md) | **English**

Personalized configurations for neovim, tmux, zsh, and more.

Written with Arch Linux in mind. It will probably work on other POSIX-compatible systems too.

I've been maintaining these dotfiles since 2025, and since I'm still learning, expect frequent large changes.

## Installation

These dotfiles are applied with `stow`.

1. Install `stow`
  - **Arch Linux**
```sh
sudo pacman -Syu stow
```

  - **Debian-like**
```sh
sudo apt install stow
```

2. `cd home`

3. Run `stow`
  - Example:
```sh
stow -t "$HOME" tmux nvim
```
