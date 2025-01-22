PATH=$PATH:~/.local/bin:~/go/bin
printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n"

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b) '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f:%F{white}${vcs_info_msg_0_}%f$ '

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification
ABBR_FORCE=1
ABBR_QUIET=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light olets/zsh-abbr

zinit snippet OMZP::git
autoload -U compinit; compinit

abbr rm="rm -vrf" > /dev/null
abbr cp="cp -vr" > /dev/null
abbr mv="mv -vf" > /dev/null
abbr t="tldr" > /dev/null
abbr tree="tree -C" > /dev/null
abbr ls="ls --color -lah" > /dev/null
