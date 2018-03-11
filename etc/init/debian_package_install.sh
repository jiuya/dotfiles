#!/bin/bash
if type apt-get 2>/dev/null 1>/dev/null
then
echo "debian init start!"
else
    exit 1
fi

package=(gcc make git neovim tmux zsh curl sakura compton htop fcitx volumeicon-alsa network-manager-gnome dunst feh lightdm i3 suckless-tools i3blocks cmake clang libssl-dev scrot exuberant-ctags sxiv imagemagick i3lock)

sudo bash -c "apt-get install -y aptitude"
sudo bash -c "aptitude install -y ${package[*]}"

if [ ! -f ~/.cargo/env ] ; then
    curl https://sh.rustup.rs -sSf | sh
fi
if [ ! -f ~/.zplug/init.zsh ] ; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
if [ ! -f /etc/systemd/system/i3lock.service ] ; then
    sudo bash -c "cp ~/dotfiles/service/i3lock.service /etc/systemd/system/i3lock.service"
fi
if [ ! -d ~/.pyenv ] ; then
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ ! -d ~/.tmux/tmux-powerline ] ; then
    git clone git://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline
fi
sudo bash -c "systemctl enable i3lock.service"
sudo bash -c "dpkg-reconfigure lightdm"
chsh -s /usr/bin/zsh
