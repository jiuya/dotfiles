# colored GCC warnings and errors
#set -x GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tj='trans {en=ja}'
alias te='trans {ja=en}'
alias tjb='trans {en=ja} -b'
alias teb='trans {ja=en} -b'

set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
set -x XDG_CONFIG_HOME $HOME/.config
#set -x TERM xterm-color256
#alias activate="source $PYENV_ROOT/versions/anaconda3-4.1.0/bin/activate"
source ~/.cargo/env
set -x RUST_SRC_PATH ~/local/src/rustc-1.4.0/src
if test -d ~/.go
    set -x GOPATH ~/.go
    set -x PATH $PATH ~/.go/bin
    set -x GOROOT /usr/local/go
    set -x PATH $GOROOT/bin $PATH
end
#set -x PATH "$HOME/local/depot_tools:${PATH}"
#set -x PATH "$HOME/local/skia/bin:${PATH}"
set -x PATH $HOME/local/nRF5x-Command-Line-Tools_9_7_3_Linux-x86_64/nrfjprog $PATH
set -x PATH $HOME/local/nRF5x-Command-Line-Tools_9_7_3_Linux-x86_64/mergehex $PATH
if test -d $HOME/.anyenv
  export PATH $HOME/.anyenv/bin $PATH
  eval (anyenv init -)
end

tmux
