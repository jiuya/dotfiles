#!/bin/bash
if type apt-get 2>/dev/null 1>/dev/null
then
echo "debian init start!"
else
    exit 1
fi

package=(gcc make git neovim tmux zsh curl)

sudo bash -c "apt-get install -y aptitude"
sudo bash -c "aptitude install -y ${package[*]}"

if type rustup 2>/dev/null 1>/dev/null ; then
	echo "installed rust"
else
    curl https://sh.rustup.rs -sSf | sh
fi
if [ ! -f ~/.zplug/init.zsh ] ; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
if [ ! -d ~/.pyenv ] ; then
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
