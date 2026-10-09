# Lilamaris's dotfiles

[Korean](README.md) | **English**

Personalized configurations for neovim, tmux, zsh, and more.

Written with Arch Linux in mind. It will probably work on other POSIX-compatible systems too.

I've been maintaining these dotfiles since 2025, and since I'm still learning, expect frequent large changes.

## Components

| Package | Purpose |
| --- | --- |
| `alacritty` | The terminal emulator used day to day |
| `zsh` | Default shell (environment variables · options · aliases · completion) |
| `starship` | Shell prompt |
| `tmux` | Terminal multiplexer |
| `nvim` | Default editor |
| `hypr` | Wayland compositor (Hyprland) |
| `neru` | Keyboard-driven screen control (hints · grid · scroll) |
| `matugen` | Generates UI color palettes from the wallpaper |
| `fastfetch` | Prints system information in the terminal |
| `fontconfig` | System-wide font matching and rendering defaults |
| `assets` | Static assets such as wallpapers, logos and ASCII artwork |

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
