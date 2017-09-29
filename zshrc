# set -x

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin

alias 49.3='sudo $(fc -ln -1)'

source ~/.zsh/antigen.zsh
source ~/.zsh/pure.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle rsync
antigen bundle python
antigen bundle node
# antigen bundle npm
# antigen bundle rake
# antigen bundle rvm
# antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle kennethreitz/autoenv
# antigen bundle command-not-found
# antigen bundle history
antigen bundle tmux
# antigen bundle vundle
# antigen bundle sprunge
antigen bundle coffee
antigen bundle docker
antigen bundle github
# antigen bundle postgres
antigen bundle supervisor
antigen bundle vagrant

antigen apply

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/dev/android/platform-tools:$HOME/dev/android/tools:$HOME/dev/android/build-tools/23.0.2 # Android SDK

export ANDROID_HOME=$HOME/dev/android

export PATH="/home/david/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# eval $(ssh-agent)
# ssh-add
# ssh-add ~/.ssh/id_rsa_pro

# set +x
