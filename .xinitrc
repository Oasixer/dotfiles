[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset -b
exec i3

export GOPATH=$HOME/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
