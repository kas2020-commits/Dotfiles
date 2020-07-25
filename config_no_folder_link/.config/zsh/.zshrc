#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

## Git Integration ##
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yello}%b%f '
zstyle ':vcs_info:*' enable git

## Setting prompt ##
# Left
PROMPT='%(?.%F{cyan}.%F{red})%B━%f%b ' # > ━❯ is an alternative prompt
# Right
RPROMPT=\$vcs_info_msg_0_ # Displays branch name of git repo if in one
RPROMPT+='%F{green}%1~ ' # Display cwd
# RPROMPT+='%F{cyan}%T%f' # Display time (%T = 24h, %t = 12h)

## History: ##
# setopt SHARE_HISTORY # share history across multiple zsh sessions
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
# bindkey -v
# export KEYTIMEOUT=1

## Use vim keys in tab complete menu: ##
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## Some Aliases ##

# Basic
alias ls="ls -A --color=auto --group-directories-first"
alias grep="rg"
alias hg="history | grep -i"

# Git-related
alias gs="git status"
alias ga="git add ."
alias gm="git commit -m"
alias gi="git clean --interactive"

# Shortcuts
alias g14="g++ -std=c++14 -Wall -g"

se () {
	fd -H -E .git -t f . | fzf | xargs -r "$EDITOR"
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -E .git -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
# pacs() {
#     sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
#     # sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
# pacr() {
# 	sudo pacman -Rns $(pacman -Q | awk '{print $1}' | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
# pacu() {
# 	sudo pacman -Syu && checkupdates | wc -l > "${HOME}/.local/share/arch_updates"
# }

bindkey -s "^f" 'cd_with_fzf^M'
bindkey -s "^r" 'cat "$HISTFILE" | fzf^M'
bindkey -s "^n" "$EDITOR^M"
