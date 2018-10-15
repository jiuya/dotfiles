#!/bin/bash
if type apt-get 2>/dev/null 1>/dev/null
then
echo "debian init start!"
else
    exit 1
fi

package=(gcc make git neovim tmux zsh curl sakura compton htop fcitx volumeicon-alsa network-manager-gnome dunst feh suckless-tools zlib1g-dev libssl-dev fish libbz2-dev translate-shell)
package_dev=(clang clang-format global)

sudo bash -c "wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O /tmp/Release.key"
sudo bash -c "apt-key add - < /tmp/Release.key"
sudo bash -c "echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:2.list"

sudo bash -c "apt-get update"
sudo bash -c "apt-get install -y aptitude"
sudo bash -c "aptitude install -y ${package[*]}"
sudo bash -c "aptitude install -y ${package_dev[*]}"


if [ ! -f ~/.cargo/env ] ; then
    curl https://sh.rustup.rs -sSf | sh
fi
if [ ! -f ~/.zplug/init.zsh ] ; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
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
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
#sudo bash -c "dpkg-reconfigure lightdm"
chsh -s /usr/bin/fish
