export PATH=$HOME/bin:/usr/local/bin:$PATH 

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
antigen bundle atom
antigen bundle coffee
antigen bundle docker
antigen bundle github
antigen bundle nyan
antigen bundle postgres
antigen bundle supervisor
antigen bundle vagrant

antigen apply


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


# added by travis gem
[ -f /home/david/.travis/travis.sh ] && source /home/david/.travis/travis.sh
