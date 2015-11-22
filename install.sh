cd ~

echo "Dotfiles setup..."

ln -sf .dotfiles/gitconfig .gitconfig
ln -sf .dotfiles/gitexcludes .gitexcludes
ln -sf .dotfiles/tmux.conf .tmux.conf
ln -sf .dotfiles/zshrc .zshrc

mkdir -p .zsh
ln -sf .dotfiles/zsh/* .zsh/

echo "                  done!"
