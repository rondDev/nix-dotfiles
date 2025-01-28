set -g fish_greeting
if status is-interactive
    starship init fish | source
end

set -Ux EDITOR nvim

zoxide init fish | source

abbr -a mkdir "mkdir -p"
alias vi="nvim"
alias vim="nvim"
alias ns="nix-shell -p"
alias nrs="sudo nixos-rebuild switch"
alias ani="ani-cli"
alias lg="lazygit"
alias ld="lazydocker"


function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
