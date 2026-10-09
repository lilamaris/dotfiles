# Lilamaris's dotfiles

**한국어** | [English](README.en.md)

neovim, tmux, zsh 등을 위한 개인화된 구성입니다.

Arch Linux를 기준으로 작성했습니다. POSIX 호환 운영체제에서도 아마 동작할 거에요.

2025년부터 관리해 온 dotfiles이고, 많은 것을 배우는 중이라 큰 변경이 잦습니다.

## 구성

| 패키지 | 용도 |
| --- | --- |
| `alacritty` | 주로 사용하는 터미널 에뮬레이터 |
| `zsh` | 기본 셸 (환경 변수 · 옵션 · alias · completion) |
| `starship` | 셸 프롬프트 |
| `tmux` | 터미널 멀티플렉서 |
| `nvim` | 기본 에디터 |
| `hypr` | Wayland 컴포지터 (Hyprland) |
| `neru` | 키보드로 화면을 조작하는 도구 (hints · grid · scroll) |
| `matugen` | 배경화면을 기반으로 UI 색상 팔레트를 생성 |
| `fastfetch` | 터미널에 시스템 정보를 출력 |
| `fontconfig` | 시스템 폰트 매칭 · 렌더링 기본값 |
| `assets` | 배경화면 · 로고 · ASCII 아트워크 같은 정적 에셋 |

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
