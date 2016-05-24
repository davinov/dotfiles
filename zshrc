export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin

alias 49.3='sudo $(fc -ln -1)'

source ~/.zsh/antigen.zsh
source ~/.zsh/pure.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle rsync
antigen bundle python
antigen bundle virtualenvwrapper
antigen bundle node
antigen bundle npm
antigen bundle rake
antigen bundle rvm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle kennethreitz/autoenv
antigen bundle command-not-found
antigen bundle history
antigen bundle tmux
antigen bundle vundle
antigen bundle sprunge
antigen bundle fabric
antigen bundle capistrano
antigen bundle coffee
antigen bundle docker
antigen bundle github
antigen bundle nyan
antigen bundle postgres
antigen bundle supervisor
antigen bundle vagrant

antigen apply


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/dev/sdk/android/platform-tools:$HOME/dev/sdk/android/tools:$HOME/dev/sdk/android/build-tools/23.0.2 # Android SDK

export PATH="/home/david/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval $(ssh-agent)
