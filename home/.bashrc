if [ "$(pgrep ssh-agent)" = "" ] ; then
	eval `ssh-agent -s`
fi

if [[ $- == *i* ]]; then
	exec fish
fi
	PATH=${PATH}:~/.local/bin:~/go/bin
fi
