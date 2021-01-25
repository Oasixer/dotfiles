[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset -b
exec i3

export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
