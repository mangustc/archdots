if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" /usr/local/bin/pfetch-kitties
end

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec Hyprland
    end
end

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

abbr rm "rm -vrf";
abbr cp "cp -vr";
abbr mv "mv -vf";
abbr t "tldr";
abbr tree "tree -C";

alias clear='clear && printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" /usr/local/bin/pfetch-kitties'
alias yay='paru'
alias sudo='doas'
alias f='fzf --preview="bat --color=always --style=plain {}"'
alias fn='nvim $(fzf --preview="bat --color=always --style=plain {}")'

set -Ua fish_user_paths $HOME/go/bin/ $fish_user_paths
