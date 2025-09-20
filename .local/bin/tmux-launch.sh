#!/usr/bin/env bash
set -euo pipefail

TMUX_LABEL="shared" # 고정 소켓명(서버 1개)
new_session_name() { echo "term-$(date +%s%N)"; }

server_up() { tmux -L "$TMUX_LABEL" list-sessions >/dev/null 2>&1; }
attached_clients() { tmux -L "$TMUX_LABEL" list-clients 2>/dev/null | wc -l | awk '{print $1}'; }
last_active_session() {
  tmux -L "$TMUX_LABEL" list-sessions -F "#{session_last_attached} #{session_name}" |
    sort -nr | awk 'NR==1 {print $2}'
}

# 서버가 없으면: 최근 세션이란 게 없으니 새로 하나 만들고 '지속 세션'로 둔다(훅 X).
if ! server_up; then
  tmux -L "$TMUX_LABEL" new-session -s "main"
  exit $?
fi

# 이미 어떤 창(클라이언트)이라도 붙어 있으면 → 에페메랄 세션 생성 + per-session 훅 심기
if [ "$(attached_clients)" -ge 1 ]; then
  SNAME="$(new_session_name)"
  tmux -L "$TMUX_LABEL" new-session -d -s "$SNAME"

  # 이 세션에서 마지막 클라이언트가 떨어지는 순간, 세션 자동 삭제
  tmux -L "$TMUX_LABEL" set-hook -t "$SNAME" client-detached \
    'if -F "#{==:#{session_attached},0}" "kill-session -t #{session_name}"'

  # 지금 터미널을 그 세션에 붙이기
  tmux -L "$TMUX_LABEL" attach -t "$SNAME"
  exit $?
fi

# 클라이언트가 하나도 없으면 → 마지막 활동 세션으로 복귀(이건 '지속 세션', 훅 없음)
LAST="$(last_active_session || true)"
if [ -n "${LAST:-}" ]; then
  tmux -L "$TMUX_LABEL" attach -t "$LAST"
  exit $?
fi

# 혹시 세션이 하나도 없다면 안전하게 새로 시작(지속 세션)
tmux -L "$TMUX_LABEL" new-session -s "main"
