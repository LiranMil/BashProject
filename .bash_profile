#!/bin/bash
echo "Hello $USER"

export COURSE_ID="__REPO_NAME__"

if [ -f ~/.token ];
then
permissions=$(stat -c %a ~/.token)
if [ $permissions != "600" ];
then
echo "Warning: .token file has too open permissions"
fi
fi

umask 027

export PATH=$PATH:/home/$USER/usercommands

DATE_NOW=$(date -u +"%Y-%m-%dT%H:%M:%S%z")
echo "The current date is: $DATE_NOW"

alias ltxt='ls -l *.txt'

mkdir -p ~/tmp
rm -rf ~/tmp/*

kill -9 $(lsof -tiUDP:8080) 2>/dev/null