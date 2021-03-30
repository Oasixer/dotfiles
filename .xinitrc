#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xmodmap /home/k/.Xmodmap
xbindkeys
xset -b

export GOPATH=$HOME/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#exec /home/k/proj/app_switcher_bg/client.sh &
