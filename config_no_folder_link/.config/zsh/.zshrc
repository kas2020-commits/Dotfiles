# ## Git Integration ##
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# zstyle ':vcs_info:git:*' formats "%F{yellow}[%b]%f"
# zstyle ':vcs_info:*' enable git

# ## Setting prompt ##
# # PROMPT='%(?.%F{green}.%F{red})%B━%f%b ' # > ━❯ is an alternative prompt
# # RPROMPT='%F{cyan}[%2~]' # > ━❯ is an alternative prompt
# RPROMPT=\$vcs_info_msg_0_ # Displays branch name of git repo if in one
PROMPT='%(?.%F{cyan}.%F{red})❯ %f'
# # RPROMPT+='%F{green}%1~' # Display cwd
RPROMPT+='%F{blue}[%1~]%F{cyan}[%T]%f' # Display time (%T = 24h, %t = 12h)
# # %B%F{red}%(?..%? )%f%b%B%F{blue}%n%f%b@%m %B%40<..<%~%<< %b%#

# ## History: ##
setopt HIST_IGNORE_DUPS # do not store duplications
setopt HIST_FIND_NO_DUPS #ignore duplicates when searching
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# ## auto/tab complete ##
# # setopt CORRECT # Enables the chance for zsh to correct slight spelling errors
# # setopt CORRECT_ALL # Applies previous line to all things
autoload -U compinit
zstyle ':completion:*' menu select
# ## case insensitive path-completion ##
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# zmodload zsh/complist
# set -o autocd  # Autocd enabled
# set +o caseglob # case insensitive globbing
# set +o casematch # no need for case matching
compinit
# _comp_options+=(globdots)       #Include hidden files


# # Basic
alias ls="ls -A --color=auto --group-directories-first"
alias gs="git status"
alias ga="git add ."
alias gm="git commit -m"
# alias make="make -j16"
alias R="R --quiet"
# alias autoclean="sudo pacman -R $(pacman -Qdtq)"

se() {
	fd -H -E .git -t f . | fzf | xargs -r "$EDITOR"
}
cd_with_fzf() {
	cd $HOME && cd "$(fd -E .git -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
pacs() {
	sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
	# sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}
pacr() {
	sudo pacman -Rns $(pacman -Q | awk '{print $1}' | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}

bindkey -s "^f" 'cd_with_fzf^M'

echo -ne '\e[4 q'
