# set vi mode
set -o vi

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias c='clear'
alias h='history'
alias ..='cd ..'
alias ,,="cd ../.."
alias .a="./a.out"
alias etc="workon etc"

## cdd
if [ -f ~/Dropbox/bin/cdd ]
then
    #echo the file exists
    . ~/Dropbox/bin/cdd
fi


cd() {
      builtin cd "$@"
        local ret=$?
          ((ret)) || _cdd_chpwd
            return $ret
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

 case "${OSTYPE}" in
darwin*)
    alias ls="ls -G"
    alias ll="ls -alFG"
    alias la="ls -laG"
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    export SVN_EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
    export VIRTUALENVWRAPPER_PYTHON="/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7"
    #export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7"

    if [ -f ~/.virtualenvwrapperrc ]; then
          export WORKON_HOME=~/.virtualenvs
          source ~/.virtualenvwrapper.sh
    fi
;;
linux*)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    alias tmux='tmux -2'
    if [ -f /usr/local/bin/vim ]; then
        alias vim='/usr/local/bin/vim'
    else
        alias vim='/usr/bin/vim'
    fi
    alias vim='/usr/bin/vim'
    if [ -f ~/.virtualenvwrapperrc ]; then
          export VIRTUALENVWRAPPER_PYTHON=/usr/bin/pythonhogehog
          export WORKON_HOME=~/Envs
          source /usr/local/bin/virtualenvwrapper.sh
    fi
;;
esac
## git settings
source $HOME/bin/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='$(__git_ps1)\[\033[00m\]\$ |<[\e[0;34m\t\e[0m] \e[0;33m\u@\h\e[1;32m\w\e[0m>\n|_>$'
