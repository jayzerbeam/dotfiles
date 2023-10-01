# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ================================================================
# User-defined aliases
# ================================================================

# Bare dotfiles repo for version control
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Dotfiles
alias nb="nvim ~/.bashrc"
alias nt="nvim ~/.tmux.conf"
alias ng="nvim ~/.gitconfig"
alias nw="nvim ~/.wezterm.lua"
alias nconf="cd ~/.config/nvim/"

# Tmux
alias tm="tmux"
alias td="tm detach"
alias tls="tm ls"
alias tas="tm attach-session"
alias tks="tm kill-session"

# Program shortcuts
alias nv="nvim"
alias dn="dotnet"
alias pvc="protonvpn-cli"

# npm 
alias nrs="npm run start"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrt="npm run test"
alias nrv="npm run serve"

# Commands
alias rb="source ~/.bashrc"
alias rt="tmux source ~/.tmux.conf"
alias pbcopy="xclip -sel clip"
alias x="exit"
alias hist="hstr"
alias cl="clear"
alias upg="sudo apt-get update && sudo apt-get upgrade"

# Git shortcuts
alias g="git"
alias ga="g add"
alias gbr="g branch"
alias gci="g commit"
alias gco="g checkout"
alias gcom="g checkout main"
alias gcp="g cherry-pick"
alias gdif="g diff"
alias gft="g fetch"
alias glg="g log"
alias gpl="g pull"
alias gpu="g push"
alias grb="g rebase"
alias grr="g restore"
alias grt="g reset"
alias gstl="g status --long"
alias gsts="g status --short"

# Locations
alias desk="cd ~/Desktop/"
alias down="cd ~/Downloads/"
alias docs="cd ~/Documents/"
alias proj="cd ~/projects/"
alias fso="cd ~/projects/full-stack-open/"
alias gai="cd ~/Documents/omscs/courses/gai/"
alias gaipp="cd ~/Documents/omscs/courses/gai/GameAIPathPlanning/"
alias fonts="cd ~/.local/share/fonts/"

# ================================================================
# dotnet
# ================================================================

export DOTNET_ROOT="/usr/share/dotnet"
export MSBuildSDKsPath=$(echo /usr/share/dotnet/sdk/7.*/Sdks)
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ================================================================
# vi mode
# ================================================================

set -o vi

# ================================================================
# Man Page Colors
# ================================================================
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

PATH="$HOME/.local/bin:$PATH"

export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).
# Usage: hstr [option] [arg1] [arg2]...
# Shell history suggest box:
#
#   --favorites              -f ... show favorites view
#   --kill-last-command      -k ... delete last command in history
#   --non-interactive        -n ... print filtered history and exit
#   --show-configuration     -s ... show configuration to be added to ~/.bashrc
#   --show-zsh-configuration -z ... show zsh configuration to be added to ~/.zshrc
#   --show-blacklist         -b ... show commands to skip on history indexation
#   --insert-in-terminal=[c] -i ... insert command c in terminal prompt and exit
#   --version                -V ... show version details
#   --help                   -h ... help
#
# Report bugs to martin.dvorak@mindforger.com
# Home page: https://github.com/dvorka/hstr
