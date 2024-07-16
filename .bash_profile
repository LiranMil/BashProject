#!/bin/bash

echo "Hello $USER"

export COURSE_ID="__REPO_NAME__"

if [ -f ~/.token ]; then
    perms=$(stat -c "%a" ~/.token)
    if [ "$perms" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

umask 0077 || {
    echo "Bad user umask"
    exit 1
}

export PATH="$PATH:$HOME/usercommands"

echo "The current date&time is: $(date -u +'%Y-%m-%dT%H:%M:%S%z')"

alias ltxt='ls *.txt'

if [ -d ~/tmp ]; then
    rm -rf ~/tmp/*
else
    mkdir ~/tmp
