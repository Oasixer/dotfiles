# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

#alias steal="yaourt -S"

#alias connect="nmcli device wifi connect"

#alias info="info --vi-keys"

# Enable colors and change prompt:
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#plugins=(git zsh-syntax-highlighting)
plugins=(git zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -r '^I'
bindkey '^I' list-choices
bindkey "^[l" complete-word
bindkey -M menuselect '^I' expand-word
bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect '^[k' vi-up-line-or-history
bindkey -M menuselect '^[l' vi-forward-char
bindkey -M menuselect '^[j' vi-down-line-or-history

# bindkey -v '^?' backward-delete-char

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
GOOGLE_APPLICATION_CREDENTIALS="/home/k/credentials.json" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/k/programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/k/programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/k/programs/google-cloud-sdk/completion.zsh.inc'; fi
