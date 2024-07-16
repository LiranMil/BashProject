#!/bin/bash

USERNAME=$(whoami)
echo "Hello $USERNAME"

export COURSE_ID="__REPO_NAME__"

if [ -f ~/.token ]; then
    TOKEN_PERMS=$(stat -c "%a" ~/.token)
    if [ "$TOKEN_PERMS" -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

umask 0027

CURRENT_UMASK=$(umask)
echo "Current umask is: $CURRENT_UMASK"

export PATH=$PATH:/home/$USERNAME/usercommands

echo "The current date&time is: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"

alias ltxt='ls *.txt'

if [ ! -d ~/tmp ]; then
    mkdir ~/tmp
else
    rm -rf ~/tmp/*
fi

PORT_PID=$(lsof -t -i:8080)
if [ ! -z "$PORT_PID" ]; then
    kill -9 $PORT_PID
fi