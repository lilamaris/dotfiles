#!/usr/bin/env bash

set -e

main_slabel=${SESSION_MAIN:-main}
ephemeral_slabel=${SESSION_EPM:-ephm}
tmux_label=${TMUX_LABEL:-default}
sessions=$(
  tmux -L "$tmux_label" list-session \
    -F "#{session_attached} #{session_name} #{session_last_attached}" 2>/dev/null ||
    true
)

echo -e "TMUX Sessions List\n $sessions"

# if no sessions exists on the tmux server,
# create a 'main' session and attach to it.
if [ -z "$sessions" ]; then
  exec tmux -L "$tmux_label" new-session -s main
fi

main_attached=$(
  echo "$sessions" |
    awk -v main="$main_slabel" '$2 == main {print $1}'
)

# if the 'main' session exists but no client is attached to it,
# attach to the 'main' session.
if [ "$main_attached" -eq 0 ]; then
  exec tmux -L "$tmux_label" attach -t "$main_slabel"
else
  # if another client is already attached to the 'main' session,
  # search for detached session
  recent_detached=$(
    echo "$sessions" |
      awk -v main="$main_slabel" '$1 == 0 && $2 != main {print $2}' |
      sort -u
  )

  recent_count=$(echo "$recent_detached" | grep -c . || true)

  if [ "$recent_count" -eq 0 ]; then
    # If there are no active sessions, create a new temporary session.
    name=$(printf "$ephemeral_slabel-%04d" $((RANDOM % 10000)))
    exec tmux -L "$tmux_label" new-session -s "$name"
  elif [ "$recent_count" -eq 1 ]; then
    # If there is exactly one active session, attach to that session immediately.
    exec tmux -L "$tmux_label" attach -t "$recent_detached"
  else
    # If there are multiple active sessions, select one using fzf.
    choice=$(echo "$recent_detached" |
      fzf --prompt="Attach session> " --reverse --preview 'tmux -L '"$tmux_label"' list-windows -t {}' --preview-window=down:30%)
    [ -n "$choice" ] && exec tmux -L "$tmux_label" attach -t "$choice"
  fi
fi
