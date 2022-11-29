# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="edvardm"
DISABLE_AUTO_TITLE=true

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew capistrano git node npm osx rails rake)

source $ZSH/oh-my-zsh.sh
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval $( gdircolors -b $HOME/.dotfiles/LS_COLORS/LS_COLORS )



# User configuration

######################
#  Personal Aliases  #
######################
alias tmux="TERM=screen-256color-bce tmux"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias rsync='noglob rsync'
alias ll="ls -laF"



#####################
#  Personal Config  #
#####################

# Preferred editor for local and remote sessions
export EDITOR='vim'



#######################
#  Ruby/Rails Config  #
#######################
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_FREE_MIN=500000
#export RUBY_HEAP_MIN_SLOTS=40000
## Boost Ruby 2.x
#export RUBY_GC_HEAP_INIT_SLOTS=1000000 # 1M
#export RUBY_GC_HEAP_FREE_SLOTS=500000  # 0.5M
#export RUBY_GC_HEAP_GROWTH_FACTOR=1.1
#export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=10000000 # 10M
#export RUBY_GC_MALLOC_LIMIT_MAX=1000000000    # 1G
#export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.1
# export RUBY_GC_OLDMALLOC_LIMIT=500000000      # 500M
# export RUBY_GC_OLDMALLOC_LIMIT_MAX=1000000000 # 1G
# export RUBY_GC_OLDMALLOC_LIMIT_GROWTH_FACTOR=1.1

export CUCUMBER_FORMAT=progress
export TURN_FORMAT=dot

#alias wip="bundle exec rake cucumber:wip"
#alias full_test="time rake spec:no_acceptance; time cucumber -t ~@run_solo -t ~@in_progress -t ~@javascript features; time rake spec:acceptance:no_javascript"
#alias migrate_all_databases="rake db:migrate && RAILS_ENV=test rake db:migrate"



####################
# PATH Shenanigans #
####################
#export GOPATH="$HOME/go"

# Yarn
#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Go
#export PATH=$PATH:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# not sure what these are
#export PATH=$PATH:"/usr/local/bin:/usr/local/share/npm/bin:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export PATH="/usr/local/sbin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source $HOME/.dotfiles/machine-specific-zshrc-files/*

