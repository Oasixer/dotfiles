# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# bindkey -M menuselect -r '^I'
# Path to your oh-my-zsh installation.
export ZSH="/home/k/.oh-my-zsh"

ZSH_THEME="birame"
#ZSH_THEME=""

ENABLE_CORRECTION="true"

export EDITOR="nvim"
export BROWSER="google-chrome-stable"

export term="xterm-256color"

alias ll="ls -lh"
alias la="ls -lah"

#alias up="cd .."
#alias up2="cd ..; cd .."

alias vim="nvim"

alias cls="clear"
alias rl="source ~/.zshrc"

#max brightness
alias brm="cat /sys/class/backlight/intel_backlight/max_brightness"
alias br="/sys/class/backlight/intel_backlight"


# Path aliases
setopt AUTO_CD
hash -d config=~/.config
hash -d polybar=~/.config/polybar
hash -d backr=~/proj/backr
hash -d scraper=~/proj/backr/Twitter_API_Container
hash -d streamer=~/proj/backr/Tweet-Streamer
hash -d nvim=~/.config/nvim
hash -d polybar=~/.config/polybar
hash -d i3=~/.config/i3
hash -d notes=~/Documents/notes
hash -d proj=~/proj
hash -d rocketry=~/proj/rocketry
hash -d minerva=~/proj/rocketry/minerva
hash -d vent=~/proj/rocketry/cansw_vent

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

# Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion match_prev_cmd)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=()

#plugins=(git zsh-syntax-highlighting)
# plugins=(git zsh-syntax-highlighting vi-mode zsh-autosuggestions)
# plugins=(git zsh-syntax-highlighting vi-mode zsh-completions zsh-autosuggestions)
# plugins=(git zsh-syntax-highlighting vi-mode zsh-completions zsh-autosuggestions)
# plugins=(git zsh-syntax-highlighting vi-mode zsh-autosuggestions)
plugins=(git zsh-syntax-highlighting vi-mode)
# autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# vi mode
bindkey -v
export KEYTIMEOUT=1


# zstyle ':autocomplete:*' key-binding off
zstyle ':autocomplete:*' config off
# function precmd_remove_up_down_bindkey() {
  # bindkey '^[OA' up-line-or-history
  # bindkey '^[OB' down-line-or-history
# }

# autoload -Uz add-zsh-hook
# add-zsh-hook precmd precmd_remove_up_down_bindkey

# Use vim keys in tab complete menu:
# bindkey -M menuselect '^[[D' accept-and-hold
bindkey -r '^I'
# bindkey -M menuselect -r '^I'

# SHIFT TAB
# bindkey -M menuselect '^[[Z' _complete_word
# bindkey '^[[Z' autosuggest-accept

# bindkey -M menuselect '^I' menu-complete
# bindkey '^[j' menu-select
# bindkey '^I' _complete_word
# bindkey -M menuselect '^I' expand-word

# bindkey '^I' autosuggest-accept
# bindkey '^[j' complete-word
# bindkey '^[j' history-beginning-search-forward

bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect '^[k' vi-up-line-or-history
bindkey -M menuselect '^[l' vi-forward-char
bindkey -M menuselect '^[j' vi-down-line-or-history

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

PATH="/home/k/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/k/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/k/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/k/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/k/perl5"; export PERL_MM_OPT;
GOOGLE_APPLICATION_CREDENTIALS="/home/k/backr-dev-cred.json" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/k/programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/k/programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/completion.zsh.inc'; fi
