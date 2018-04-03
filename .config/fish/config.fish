# colored GCC warnings and errors
#set -x GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
set -x XDG_CONFIG_HOME $HOME/.config
#set -x TERM xterm-color256
#alias activate="source $PYENV_ROOT/versions/anaconda3-4.1.0/bin/activate"
source ~/.cargo/env
set -x RUST_SRC_PATH ~/local/src/rustc-1.4.0/src
set -x GOPATH $HOME/.go
set -x PATH $PATH $HOME/.go/bin
set -x GOROOT /usr/local/go
set -x PATH $GOROOT/bin $PATH
#set -x PATH "$HOME/local/depot_tools:${PATH}"
#set -x PATH "$HOME/local/skia/bin:${PATH}"
if test -d $HOME/.anyenv
  export PATH $HOME/.anyenv/bin $PATH
  eval (anyenv init -)
end


