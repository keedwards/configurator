# Set up bash history
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTSIZE=10000000
export HISTFILESIZE=$HISTSIZE
export HISTFILE=$HOME/.bash_history
export HISTIGNORE='ls:bg:fg:history'
export HISTTIMEFORMAT='%F %T '

# Personal Utilities
export PATH="$HOME/bin:$PATH"
export SRC=$HOME/src

# Coreutils
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/share/man:/usr/local/share/man:/usr/share/man"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Golang
export GOPATH=$SRC/go
export PATH=/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH


# Homebrew
export HOMEBREW_BUILD_FROM_SOURCE=true
export PATH="/usr/local/sbin:$PATH"

# Text editing
export EDITOR='emacsclient -tq'
export VISUAL="$EDITOR"

# Z
[ -f `brew --prefix`/etc/profile.d/z.sh ] && source `brew --prefix`/etc/profile.d/z.sh

# rbenv
hash rbenv 2>/dev/null && eval "$(rbenv init -)"

# Put cwd in python path
export PYTHONPATH=.
export PYSPARK_DRIVER_PYTHON=ipython
alias python=ipython

# Virtual Env Wrapper
[ -z /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
  for file in $(brew --prefix)/etc/bash_completion.d/*; do source $file; done
fi

export PS1='\w '

export GPG_TTY=`tty`

# SSH Agent
# export SSH_AGENT_PID=`pgrep ssh-agent`
# export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock
# [ -z "$SSH_AGENT_PID" ] && eval $(ssh-agent -a $SSH_AUTH_SOCK) > /dev/null


# Color man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# thefuck
hash thefuck 2>/dev/null && eval "$(thefuck --alias)"

# Credentials
[ -f $SRC/blessclient/lyftprofile ] && source $SRC/blessclient/lyftprofile
[ -f $HOME/.aliasrc ] && source $HOME/.aliasrc
[ -f $HOME/.bash_secrets ] && source $HOME/.bash_secrets

export ANDROID_HOME=/usr/local/opt/android-sdk
source '/Users/kedwards/src/blessclient/lyftprofile' # bless ssh alias
