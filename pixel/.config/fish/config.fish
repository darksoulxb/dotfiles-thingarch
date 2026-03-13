if status is-interactive
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8
    fish_add_path ~/.local/bin
    alias ls="ls --color=auto"
end