#!/bin/sh

DISTRO="$(lsb_release -s -c)"
DISTRO_LTS="xenial"

cd ~

echo "*** Install basic packages..."
sudo apt-get install -y curl git openssh-server vim zsh
sudo apt-get install -y software-properties-common ca-certificates

echo "*** Add repositories..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
MONGO_VERSION="3.4"
echo "deb http://repo.mongodb.org/apt/ubuntu $DISTRO_LTS/mongodb-org/$MONGO_VERSION main" | sudo tee /etc/apt/sources.list.d/mongodb.list

curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
NODE_VERSION="node_8.x"
echo "deb https://deb.nodesource.com/$NODE_VERSION $DISTRO_LTS main" | sudo tee /etc/apt/sources.list.d/nodesource.list

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:moka/stable

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRO_LTS stable"

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update

echo "*** Set default shell to zsh..."
chsh -s $(which zsh)

echo "*** Install smartcart support..."
sudo apt-get install pcscd scdaemon gnupg2 pcsc-tools

echo "*** Install imaging programs..."
sudo apt-get install -y gimp inkscape

echo "*** Install dev libs and packages..."
sudo apt-get install -y build-essential zlib1g-dev
sudo apt-get install -y libsqlite3-dev libpq-dev

echo "*** Install python packages..."
sudo apt-get install -y python-dev python-pip python-setuptools virtualenv
sudo pip install virtualenvwrapper
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

echo "*** Install Ansible..."
sudo pip install ansible

echo "*** Install KVM..."
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

# echo "*** Install android required I386 libs..."
# sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1

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
sudo apt-get remove -y cmdtest # Conflicts with yarn
sudo apt-get install -y nodejs yarn

echo "*** Install ruby packages..."
sudo apt-get install -y ruby ruby-dev rubygems-integration
sudo gem install bundler

echo "*** Install java..."
sudo apt-get install oracle-java8-installer

echo "*** Install virtualbox..."
sudo apt-get install -y virtualbox

echo "*** Install docker..."
sudo apt-get install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER

echo "*** Install lastpass-cli..."
sudo apt-get install -y openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip cmake build-essential pkg-config
mkdir -p ~/apps
git clone git@github.com:lastpass/lastpass-cli.git ~/apps/lastpass
cd ~/apps/lastpass
make
sudo make install
cd ~

echo "*** Install multimedia stuff..."
sudo apt-get install -y spotify-client vlc

echo "*** Install backgrounds icons and fonts ..."
sudo apt-get install -y gnome-backgrounds gnome-themes-standard gtk2-engines-murrine moka-icon-theme ttf-ancient-fonts fonts-firacode
git clone git@github.com:GNOME/gnome-backgrounds.git ~/Pictures/gnome-backgrounds

echo "*** Install other web browsers..."
sudo apt-get install -y chromium-browser epiphany

echo "*** Install utilities..."
sudo apt-get install -y filezilla gnome-tweak-tool htop net-tools

echo "*** Install visual studio code and extensions..."
sudo apt-get install code
code --install-extension ms-python.python
code --install-extension ms-vscode.atom-keybindings
code --install-extension ph-hawkins.arc-plus
code --install-extension editorconfig.editorconfig
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension hbenl.vscode-firefox-debug

echo "*** Configure..."
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
