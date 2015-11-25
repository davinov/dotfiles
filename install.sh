#!/bin/sh

cd ~

echo "*** Install basic packages..."
sudo apt-get install -y curl git build-essential openssh-server python-dev python-pip vim
sudo pip install virtualenvwrapper

echo "*** Install MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv EA312927
MONGO_VERSION="3.0"
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/$MONGO_VERSION main" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update -q
sudo apt-get install -y mongodb-org

echo "*** Install KVM..."
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

echo "*** Install android required I386 libs..."
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1

echo "*** Install dotfiles..."
ln -sf .dotfiles/gitconfig .gitconfig
ln -sf .dotfiles/gitexcludes .gitexcludes
ln -sf .dotfiles/tmux.conf .tmux.conf
ln -sf .dotfiles/zshrc .zshrc

mkdir -p .zsh
ln -sf ../.dotfiles/zsh/antigen.zsh .zsh/antigen.zsh
ln -sf ../.dotfiles/zsh/pure.zsh .zsh/pure.zsh

echo "*** Install utlimate vimrc..."
sudo apt-get install -y ctags
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "*** Install Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "*** Install tmux..."
sudo apt-get install -y tmux

echo "*** Install node.js..."
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "*** Install basic npm packages..."
sudo npm install -g bower gulp cordova ionic

echo "*** Configure Gnome..."
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'
