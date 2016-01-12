#!/bin/sh

cd ~

echo "*** Install basic packages..."
sudo apt-get install -y curl git openssh-server vim

echo "*** Install imaging programs..."
sudo apt-get install -y gimp inkscape

echo "*** Install dev libs and packages..."
sudo apt-get install -y build-essential zlib1g-dev
sudo apt-get install -y libsqlite3-dev libpq-dev

echo "*** Install postgres..."
sudo apt-get install -y postgresql

echo "*** Install python packages..."
sudo apt-get install -y python-dev python-pip
sudo pip install virtualenvwrapper

echo "*** Install Ansible..."
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "*** Install node.js..."
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "*** Install basic npm packages..."
sudo npm install -g bower gulp cordova ionic

echo "*** Install ruby packages..."
sudo apt-get install -y ruby ruby-dev rubygems-integration
sudo gem install bundler

echo "*** Install virtualbox..."
sudo apt-get install -y virtualbox

echo "*** Install lastpass-cli..."
sudo apt-get install -y openssl libcurl3 libxml2 libssl-dev libxml2-dev libcurl4-openssl-dev pinentry-curses xclip
mkdir -p ~/apps
git clone git@github.com:lastpass/lastpass-cli.git ~/apps/lastpass
cd ~/apps/lastpass
make
sudo make install
cd ~

echo "*** Configure Gnome..."
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'
