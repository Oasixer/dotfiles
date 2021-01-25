export PATH=$HOME/bin:/usr/local/bin:/snap/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
PERL5LIB="/home/k/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/k/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/k/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/k/perl5"; export PERL_MM_OPT;
export GOPATH=$HOME/work
PATH="/home/k/perl5/bin${PATH:+:${PATH}}"; export PATH;
path+=("$HOME/programs", "$HOME/.local/bin", "/usr/local/go/bin", "$GOPATH/bin")
export path
export TMPDIR="/tmp"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="birame"

ENABLE_CORRECTION="false"

export EDITOR="nvim"
export BROWSER="google-chrome-stable"

export term="xterm-256color"

# alias ll="ls -lh"
# alias la="ls -lah"

#alias up="cd .."
#alias up2="cd ..; cd .."

alias vim="nvim"

alias cls="clear"
alias rl="source ~/.zshrc"

#max brightness
alias brm="cat /sys/class/backlight/intel_backlight/max_brightness"
alias br="/sys/class/backlight/intel_backlight"
alias startss="cd ~programs/hikkaAVStream && ./havs.sh"
alias vact="source venv/bin/activate"
alias vinst="pip install -r requirements.txt"
alias gettoken='kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep "eks-admin" | awk '"'"'{print $1}'"'"') | tail -n 1 | sed -n "s/.* \([^[:space:]]*\)$/\1/p" | xclip -selection clipboard'
alias qa-ctx='aws eks --region us-east-2 update-kubeconfig --name personifiai'
alias prod-ctx='aws eks --region us-east-2 update-kubeconfig --name personifiai-production'

alias qa-dash='aws eks --region us-east-2 update-kubeconfig --name personifiai && kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep "eks-admin" | awk '"'"'{print $1}'"'"') | tail -n 1 | sed -n "s/.* \([^[:space:]]*\)$/\1/p" | xclip -selection clipboard && xdg-open localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login & kubectl proxy'

alias prod-dash='aws eks --region us-east-2 update-kubeconfig --name personifiai-production && kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep "eks-admin" | awk '"'"'{print $1}'"'"') | tail -n 1 | sed -n "s/.* \([^[:space:]]*\)$/\1/p" | xclip -selection clipboard && xdg-open localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login & kubectl proxy'

alias qa-dash2='aws eks --region us-east-2 update-kubeconfig --name personifiai && kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep "eks-admin" | awk '"'"'{print $1}'"'"') | tail -n 1 | sed -n "s/.* \([^[:space:]]*\)$/\1/p" | xclip -selection clipboard && xdg-open localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login'

alias prod-dash2='aws eks --region us-east-2 update-kubeconfig --name personifiai-production && kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep "eks-admin" | awk '"'"'{print $1}'"'"') | tail -n 1 | sed -n "s/.* \([^[:space:]]*\)$/\1/p" | xclip -selection clipboard && xdg-open localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login'
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# vi mode
bindkey -v
export KEYTIMEOUT=1


# Path aliases
setopt AUTO_CD
hash -d config=~/.config
hash -d programs=~/programs
hash -d temp=~/temp
hash -d zplugins=~/.config/zsh-plugins
hash -d polybar=~/.config/polybar
hash -d nvim=~/.config/nvim
hash -d polybar=~/.config/polybar
hash -d i3=~/.config/i3
hash -d notes=~/Documents/notes
hash -d proj=~/proj
hash -d personifi=~/proj/personifi
hash -d pbackend=~/proj/personifi/gucci-backend
hash -d backr=~/proj/backr
hash -d scraper=~/proj/backr/Twitter_API_Container
hash -d ingest=~/proj/backr/Ingest-Server
hash -d backrapi=~/proj/backr/backrapi
hash -d rocketry=~/proj/rocketry
hash -d minerva=~/proj/rocketry/minerva
hash -d vent=~/proj/rocketry/cansw_vent
hash -d website=~/proj/website-sapper

# History in cache directory:
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(git vi-mode fzf docker docker-compose zsh-completions)

source $ZSH/oh-my-zsh.sh


# zstyle ':completion:*' extra-verbose true
source ~/.config/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zstyle ':autocomplete:tab:*' widget-style menu-select
# zstyle ':completion:list-expand:*' extra-verbose yes
zstyle ':completion:*' extra-verbose yes


bindkey -M viins '^[[A' up-line-or-search
bindkey -M viins '^[k' fzf-history-widget
bindkey -M vicmd '^[k' fzf-history-widget
bindkey -M vicmd '^[j' menu-select
bindkey -M viins '^[j' menu-select
bindkey -M menuselect $key[Tab] accept-line
bindkey $key[ControlSpace] list-expand

# Use vim keys in tab complete menu:
# bindkey -M menuselect '^[[D' accept-and-hold

# bindkey -r '^I'
# bindkey -M menuselect -r '^I'

# bindkey '^I' complete-word
# bindkey -M menuselect '^I' complete-word
# bindkey -M menuselect '^I' accept-line
bindkey -M menuselect '^[' vi-cmd-mode

# bindkey '^[l' autosuggest-accept

bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect '^[j' vi-down-line-or-history
bindkey -M menuselect '^[k' vi-up-line-or-history
bindkey -M menuselect '^[l' vi-forward-char

# bindkey '^@' list-expand

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line



# Wrap vi yank/put widgets with xclip so that we use system clipboard in zsh
function x11-clip-wrap-widgets() {
    # Note: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        # Ugh, zsh doesn't have closures
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}

local copy_widgets=(
    vi-yank vi-yank-eol
)
local paste_widgets=(
    vi-put-{before,after}
)

x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets

# menu-select-and-history-down() {
  # fzf-history-widget
  # zle menu-select
  # zle down-line-or-history-search
  # zle accept-line
# }
# zle     -N     menu-select-and-history-down
# bindkey '^[j' menu-select-and-history-down

# bindkey '^K' up-line-or-history

# bindkey -M vicmd '^[j' vi-down-line-or-history

zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    printf "\033[2 q"
else
    printf "\033[6 q"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
printf "\033[6 q"
}
zle -N zle-line-init

GOOGLE_APPLICATION_CREDENTIALS="/home/k/backr-dev-cred.json" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/k/programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/k/programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
