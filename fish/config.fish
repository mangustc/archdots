if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
fish_config theme choose "Catppuccin Mocha"

function fish_greeting
    printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" /usr/local/bin/pfetch-kitties
end

abbr rm "rm -vrf";
abbr cp "cp -vr";
abbr mv "mv -vf";
abbr t "tldr";
abbr tree "tree -C";
abbr v "nvim";
abbr vi "nvim";
abbr vim "nvim";
abbr n "nvim";

alias clear='clear && printf "\e[31m●\e[0m \e[33m●\e[0m \e[32m●\e[0m \e[36m●\e[0m \e[34m●\e[0m \e[35m●\e[0m \n\n\n" && PF_INFO="ascii title os uptime pkgs" PF_SEP="       " PF_COL1=4 PF_COL2=9 PF_COL3=1 PF_ALIGN="" PF_ASCII="Catppuccin" /usr/local/bin/pfetch-kitties'
alias c='clear'
