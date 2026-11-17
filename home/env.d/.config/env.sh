# Shared environment for POSIX-compatible shells.
. "$HOME/.config/env.d/xdg.sh"

for env_file in "$HOME"/.config/env.d/*.sh; do
  [ -r "$env_file" ] || continue
  [ "$env_file" = "$HOME/.config/env.d/xdg.sh" ] && continue
  . "$env_file"
done
unset env_file
