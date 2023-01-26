set -U fish_greeting

bass source ~/.shared_shell.sh


# ------------- Variables --------------
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x TERMINAL "kitty"
set -x VIDEO "mpv"
set -x IMAGE "feh"
set -x OPENER "handlr open"


# ------------ Tools Config ------------
# `nnn`
set -x NNN_PLUG "j:autojump"

# Color `man` Pages
set -x LESS_TERMCAP_md (set_color --bold 0280A5) # start bold
set -x LESS_TERMCAP_me (set_color normal) # end bold
set -x LESS_TERMCAP_us (set_color --underline 5BA502) # start underline
set -x LESS_TERMCAP_ue (set_color normal) # end underline
set -x LESS_TERMCAP_so (set_color --reverse F0CB02) # start standout
set -x LESS_TERMCAP_se (set_color normal) # end standout

# `less`
set -x LESS "-R"

# `virtualfish`
set VIRTUALFISH_HOME "$XDG_DATA_HOME/virtualenvs"



if status is-interactive
# ------------ Fish Config -------------
    fish_vi_key_bindings


# ----------- Abbreviations ------------
    abbr -a s "sudo"
    abbr -a nv "nvim"
    abbr -a snv "sudoedit"
    abbr -a py "python"
    abbr -a ipy "ipython"
    abbr -a j "just"
    abbr -a n "nnn"

# -------------- Aliases ---------------
# Utilities
    alias cp="cp -i"
    alias df="df -h"
    alias free="free -m"
    alias grep="grep --colour=always"

    alias ls="exa --icons"
    alias ll="exa -l --icons"
    alias la="exa -la --icons"

# Tools
    alias feh="feh --scale-down"

    alias topdf="libreoffice --headless --invisible --convert-to pdf"
    alias now="date +'%A %d/%m/%Y %H:%M:%S.%N (%Z) %nUnix time: %s'"

# To not shoot my self in the leg
    alias rm="echo -e Use the \`del\` command, unable to delete "
    alias del="rmtrash"
    alias deldir="rmdirtrash"

# Kitty's Kittens
    alias ssh="kitty +kitten ssh"
    alias icat="kitty +kitten icat"

# Drag to and from Aliases
    alias dragto="dragon-drop"
    alias dragon="dragon-drop --target --and-exit"

# ------------ Shell Things ------------
# A Shell Prompt
    starship init fish | source

# A `cd` Command Alternative
    eval "$(zoxide init fish --cmd cd)"
end



# Sources:
#    https://github.com/PatrickF1/colored_man_pages.fish/blob/f885c2507128b70d6c41b043070a8f399988bc7a/functions/cless.fish#L2,L7
