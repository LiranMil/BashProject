echo "Hello $USER"

export COURSE_ID="REPO_NAME"

if [ -f ~/.token ]
then
if [ $(stat -c %a ~/.token) != "600" ]
then
echo "Warning: .token file has too open permissions"
fi
fi

export PATH=$PATH:/home/$USER/usercommands

DATE_NOW=$(date -u +"%Y-%m-%dT%H:%M:%S%z")
echo "The current date is: $DATE_NOW"

alias ltxt='ls -l *.txt'

mkdir -p ~/tmp
rm -rf ~/tmp/*

kill -9 $(lsof -tiUDP:8080) 2>/dev/null