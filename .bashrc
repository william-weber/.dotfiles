# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# vim:ts=4:sw=4

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"



###########################################
# fancy prompt with git branch
# from: http://pastie.org/pastes/165446
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
$GREEN\$ "
PS2='> '
PS4='+ '
}
proml

## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac
#
## Comment in the above and uncomment this below for a color prompt
##PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#    ;;
#*)
#    ;;
#esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

if [ `uname -s` = "Darwin" ] ; then
    alias ls='\ls -FG'
    alias ll='\ls -aFlG'
    alias lsd='\ls -aldG * | egrep "^d"'
else
    alias ls='\ls -F --color=auto'
    alias ll='\ls -aFl --color=auto'
    alias lsd='\ls -ald --color=auto * | egrep "^d"'
fi

alias bymostrecent="ls -lurtF"  
alias bysize="ls -lurS"  
alias psg="ps -auxww | grep -i "
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias +='pushd .'
alias _='popd'
#convenient sets because i'm lazy
bdd="beardendesigns.com"
gc="glenncertain.com"
rdi="riverdaleinn.com"
lmc="lmcoutcomes.lmcmc.com"
lmcdental="lmcdental.lmcmc.com"

export EDITOR=vim
export CVS_RSH=ssh

# mysql
if [ -d /usr/local/mysql/bin ]; then
    PATH=/usr/local/mysql/bin:$PATH
fi

# php

if [ -d /usr/local/php/bin ]; then
    PATH=/usr/local/php/bin:$PATH
fi

# for fink in mac os x

if [ -f /sw/bin/init.sh ]; then
    source /sw/bin/init.sh
fi

# for ports in mac os x

if [ -d /opt/local/bin ]; then
    PATH=/opt/local/bin:$PATH
fi

# local apps
#
if [ -d /usr/local/sbin ]; then
    PATH=/usr/local/sbin:$PATH
fi

if [ -d /usr/local/bin ]; then
    PATH=/usr/local/bin:$PATH
fi

if [ -d $HOME/bin ]; then
    PATH=$HOME/bin:$PATH
fi
export PATH

# Locale info

export LC_ALL=C
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

#enable vi command line editing
set -o vi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
