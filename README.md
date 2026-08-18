# Lilamaris's dotfiles

**한국어** | [English](README.en.md)

neovim, tmux, zsh 등을 위한 개인화된 구성입니다.

Arch Linux를 기준으로 작성했습니다. POSIX 호환 운영체제에서도 아마 동작할 거에요.

2025년부터 관리해 온 dotfiles이고, 많은 것을 배우는 중이라 큰 변경이 잦습니다.

## 설치

dotfiles 적용에는 `stow`를 사용합니다.

1. `stow` 설치
  - **Arch Linux**
```sh
sudo pacman -Syu stow
```

  - **Debian-like**
```sh
sudo apt install stow
```

2. `cd home`

3. `stow` 실행
  - 예시:
```sh
stow -t "$HOME" tmux nvim
```
