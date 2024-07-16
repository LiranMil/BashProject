echo "Hello $USER"

export COURSE_ID="REPO_NAME"

if [ -e ~/.token ]; then
    permissions=$(stat -c "%a" ~/.token)
    if [ "$permissions" -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

umask 0077

export PATH="$PATH:/home/$USER/usercommands"

echo "The corrent date is: $(date -u +"%Y-%m-%dT%H:%M:%S%:z")"

alias ltxt='ls *.txt'

if [ -d ~/tmp ]; then
    rm -rf ~/tmp/*
else
    mkdir ~/tmp
fi
