## Source zsh enviornment variables ##
source .zshenv

## Enable colors and change prompt: ##
autoload -U colors && colors

## Git Integration ##
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yello}%b%f '
zstyle ':vcs_info:*' enable git

## Setting prompt ##
# Left
PROMPT='%(!.# .)' # adds a '#' to the prompt if running as root
PROMPT=$PROMPT'%(?.%F{green}.%F{red})━%f ' # Prompt
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
setopt INC_APPEND_HISTORY # adds commands as they are typed, not at shell exit
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

## Edit cmdline in vim with control+e ##
autoload edit-command-line;zle -N edit-command-line
bindkey '^e' edit-command-line


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[4 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[4 q"
}
zle -N zle-line-init
echo -ne '\e[4 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[4 q' ;} # Use beam shape cursor for each new prompt.

## Some Aliases ##
alias ls="ls --color --group-directories-first"
alias l="lsd -hA --group-dirs first"
alias grep='grep --color=auto'
alias v="nvim"
alias se="fzf | xargs -r nvim"
#alias less="less --IGNORE-CASE --LINE-NUMBERS"
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
alias dotfiles-config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

conf() {du -a ~/.local/bin/* ~/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR ;}

#neofetch
#cowfortune | lolcat
#figlet suckless
#alias the_power_of_christ_compels_you!='sudo'
ufetch.sh
