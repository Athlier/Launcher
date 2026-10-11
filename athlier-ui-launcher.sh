#!/usr/bin/env bash
set -u

APP_DIR="/run/media/adie/AI Stack/Athlier-UI/Athlier-UI"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/athlier-ui"
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/athlier-ui.lock"
LOG_FILE="$STATE_DIR/launcher.log"

mkdir -p "$STATE_DIR"
exec 9>"$LOCK_FILE"
if ! flock -n 9; then
  command -v notify-send >/dev/null 2>&1 && notify-send "Athlier UI" "Already running."
  exit 0
fi

cd "$APP_DIR" || exit 1
{
  printf '\n[%s] Starting Athlier UI\n' "$(date --iso-8601=seconds)"
  npm start
  status=$?
  printf '[%s] Athlier UI exited with status %s\n' "$(date --iso-8601=seconds)" "$status"
  if [ "$status" -ne 0 ] && command -v notify-send >/dev/null 2>&1; then
    notify-send -u critical "Athlier UI failed" "See $LOG_FILE"
  fi
  exit "$status"
} >>"$LOG_FILE" 2>&1
