#!/usr/bin/env bash

isCommand() {
  for cmd in \
    "apply" \
    "debug" \
    "groups" \
    "hash" \
    "items" \
    "lock" \
    "metadata" \
    "nodes" \
    "plot" \
    "repo" \
    "run" \
    "stats" \
    "test" \
    "verify" \
    "zen"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- bw "$@"
# check if the first argument passed in is composer
elif [ "$1" = 'bw' ]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- bw "$@"
fi

exec "$@"