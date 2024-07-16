#!/bin/bash

echo "Hello $USER"

export COURSE_ID="__REPO_NAME__"

if [ -f "$HOME/.token" ]; then
  token_perms=$(stat -c '%a' "$HOME/.token")
  if [ "$token_perms" != "600" ]; then
    echo "Warning: .token file has too open permissions"
  fi
fi

umask 0006

export PATH="$PATH:/home/$USER/usercommands"

echo "The current date is: $(date -u '+%Y-%m-%dT%H:%M:%S+00:00')"

alias ltxt='ls *.txt'

mkdir -p "$HOME/tmp"
rm -rf "$HOME/tmp/*"

fuser -k 8080/tcp 2>/dev/null