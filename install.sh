#!/bin/sh

cd ~

echo "*** Add repositories..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
MONGO_VERSION="3.4"
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/$MONGO_VERSION main" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:moka/stable
sudo add-apt-repository -y ppa:ne0sight/chrome-gnome-shell

echo "*** Install basic packages..."
sudo apt-get install -y curl git openssh-server vim zsh
sudo apt-get install -y software-properties-common

echo "*** Set default shell to zsh..."
chsh -s $(which zsh)

echo "*** Install imaging programs..."
sudo apt-get install -y gimp inkscape

echo "*** Install dev libs and packages..."
sudo apt-get install -y build-essential zlib1g-dev
sudo apt-get install -y libsqlite3-dev libpq-dev

echo "*** Install postgres..."
sudo apt-get install -y postgresql

echo "*** Install python packages..."
sudo apt-get install -y python-dev python-pip python-setuptools
sudo pip install virtualenvwrapper
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

echo "*** Install Ansible..."
sudo pip install ansible

echo "*** Install MongoDB..."
sudo apt-get install -y mongodb-org

echo "*** Install Redis..."
sudo apt-get install -y redis-server
sudo systemctl disable redis

echo "*** Install nginx..."
sudo apt-get install -y nginx
sudo systemctl disable nginx

echo "*** Install KVM..."
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

echo "*** Install android required I386 libs..."
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1

echo "*** Install utlimate vimrc..."
sudo apt-get install -y ctags
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "*** Install Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "*** Install tmux..."
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "*** Install dotfiles..."
ln -sf .dotfiles/gitconfig .gitconfig
ln -sf .dotfiles/gitexcludes .gitexcludes
ln -sf .dotfiles/tmux.conf .tmux.conf
ln -sf .dotfiles/zshrc .zshrc

mkdir -p .config/Code/User
ln -sf ~/.dotfiles/vscode-settings.json .config/Code/User/settings.json
ln -sf ~/.dotfiles/vscode-keybindings.json .config/Code/User/keybindings.json

mdir -p .ssh
ln -sf ../.dotfiles/sshconfig .ssh/config

mkdir -p .zsh
ln -sf ../.dotfiles/zsh/antigen.zsh .zsh/antigen.zsh
ln -sf ../.dotfiles/zsh/pure.zsh .zsh/pure.zsh

echo "*** Install node.js..."
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs yarn

echo "*** Install basic npm packages..."
sudo npm install -g bower gulp cordova ionic n

echo "*** Install ruby packages..."
sudo apt-get install -y ruby ruby-dev rubygems-integration
sudo gem install bundler

echo "*** Install java..."
sudo apt-get install oracle-java8-installer

echo "*** Install virtualbox..."
sudo apt-get install -y virtualbox

echo "*** Install lastpass-cli..."
sudo apt-get install -y openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip cmake build-essential pkg-config
mkdir -p ~/apps
git clone git@github.com:lastpass/lastpass-cli.git ~/apps/lastpass
cd ~/apps/lastpass
make
sudo make install
cd ~

echo "*** Configure Gnome..."
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'

echo "*** Install backgrounds icons and fonts ..."
sudo apt-get install -y gnome-backgrounds gnome-themes-standard gtk2-engines-murrine moka-icon-theme ttf-ancient-fonts fonts-firacode

echo "*** Install other web browsers..."
sudo apt-get install -y chromium-browser epiphany

echo "*** Install extensions..."
sudo apt-get install chrome-gnome-shell
