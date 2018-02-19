# Powerline font config
if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# avoid duplicate command history
export HISTCONTROL=ignoreboth

# Setup Python env
# source $HOME/py3-env/bin/activate

# Setup the Cargo path
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export PATH=$HOME/.cargo/bin:$PATH

# Setup Go path
export GOPATH=$HOME/go

# Setup local bin path
export PATH=$HOME/bin:$PATH

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Makes a newline on the prompt
set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red[\\u] "
    else
        PS1+="$Green[\\u] "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w \\n\$$Reset "
}
PROMPT_COMMAND='set_prompt'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
fi

# CUSTOM ALIASES

# some more ls aliases
alias ls='ls -F --color=auto'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'

alias rm="rm -i"
alias mv="mv -i"
alias grep='grep --color=auto'

alias reload='. ~/.bashrc'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

alias cddow='cd $HOME/Downloads'
alias cddoc='cd $HOME/Documents'

