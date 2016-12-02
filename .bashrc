# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=vim
export PS1="\n❤ \w ❤\n⌛ \t → "

set -o vi
