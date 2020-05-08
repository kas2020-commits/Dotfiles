#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

## Enable colors and change prompt: ##
autoload -U colors && colors
test -r "$DIR_COLORS_TEMPLATE" && eval $(dircolors "$DIR_COLORS_TEMPLATE")

## Git Integration ##
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yello}%b%f '
zstyle ':vcs_info:*' enable git

## Setting prompt ##
# Left
PROMPT='%(?.%F{green}.%F{red})❯%f ' # ━is an alternative prompt
# Right
RPROMPT=\$vcs_info_msg_0_ # Displays branch name of git repo if in one
RPROMPT=$RPROMPT'%F{green}%1~ ' # Display cwd
RPROMPT=$RPROMPT'%F{cyan}%T%f' # Display time (%T = 24h, %t = 12h)

## History: ##
setopt SHARE_HISTORY # share history across multiple zsh sessions
setopt APPEND_HISTORY # append to history
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first
setopt HIST_IGNORE_DUPS # do not store duplications
setopt HIST_FIND_NO_DUPS #ignore duplicates when searching
setopt HIST_REDUCE_BLANKS # removes blank lines from history
#setopt INC_APPEND_HISTORY # adds commands as they are typed, not at shell exit
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

## auto/tab complete ##
setopt CORRECT # Enables the chance for zsh to correct slight spelling errors
setopt CORRECT_ALL # Applies previous line to all things
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
set -o autocd  # Autocd enabled
set +o caseglob # case insensitive globbing
set +o casematch # no need for case matching
compinit
_comp_options+=(globdots)       #Include hidden files

## case insensitive path-completion ##
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

## vi mode ##
bindkey -v
export KEYTIMEOUT=1

## Use vim keys in tab complete menu: ##
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## Change cursor shape for different vi modes ##
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[4 q'
#   fi
# }
# zle -N zle-keymap-select

# zle-line-init() {
#     echo -ne "\e[4 q"
# }
# zle -N zle-line-init

## Some Aliases ##

# Basic
alias ls="ls --hyperlink=always --color --group-directories-first"
alias l="exa -l -a --icons --group-directories-first"
alias gr="rg"
alias less="less --IGNORE-CASE --LINE-NUMBERS"
alias v="nvim"

# Git-related
alias gs="git status"
alias ga="git add *"
alias gm="git commit -m"
alias gi="git clean --interactive"

# Tools
alias cpu-eaters='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
alias mem-eaters='ps axch -o cmd:15,%mem --sort=-%mem | head'
alias hogs='echo -e "CPU HOGGS:\n$(ps axch -o cmd:15,%cpu --sort=-%cpu | sed 3q)\nMEM HOGGS:\n$(ps axch -o cmd:15,%mem --sort=-%mem | sed 3q)"'

# Dotfiles Manager (for bare repo)
alias dootfiles='git --git-dir="$HOME"/.local/github/dootfiles --work-tree=$HOME'

## Load; Should be last ##
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
