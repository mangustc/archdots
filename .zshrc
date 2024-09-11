PATH=$PATH:~/.local/bin:~/go/bin
printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" pfetch-kitties

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color -lah $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color -lah $realpath'
ABBR_FORCE=1
ABBR_QUIET=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light olets/zsh-abbr
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git

autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

abbr rm="rm -vrf" > /dev/null
abbr cp="cp -vr" > /dev/null
abbr mv="mv -vf" > /dev/null
abbr t="tldr" > /dev/null
abbr tree="tree -C" > /dev/null
abbr ls="ls --color -lah" > /dev/null

alias clear='clear && printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" pfetch-kitties'
alias yay='paru'
alias f='fzf --preview="bat --color=always --style=plain {}"'
alias fn='nvim $(fzf --preview="bat --color=always --style=plain {}")'

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
