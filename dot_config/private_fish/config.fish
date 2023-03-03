set fish_greeting

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

# ------------ Fish Theme --------------
# Syntax Highlighting
    set fish_color_normal normal
    set fish_color_command FF9400
    set fish_color_keyword FF9400
    set fish_color_quote BF9C30
    set fish_color_redirection BF5B30
    set fish_color_end FF4C00
    set fish_color_error FFDD73
    set fish_color_param FFC000
    set fish_color_valid_path --underline
    set fish_color_option FFC000
    set fish_color_comment A63100
    set fish_color_selection white --bold --background=brblack
    set fish_color_operator 00a6b2
    set fish_color_escape 00a6b2
    set fish_color_autosuggestion FFC473
    set fish_color_cwd green
    set fish_color_cwd_root red
    set fish_color_user brgreen
    set fish_color_host normal
    set fish_color_host_remote yellow
    set fish_color_status red
    set fish_color_cancel --reverse
    set fish_color_search_match bryellow --background=brblack

# Pager Color
    set fish_pager_color_progress brwhite --background=cyan
    set fish_pager_color_background
    set fish_pager_color_prefix normal --bold --underline
    set fish_pager_color_completion normal
    set fish_pager_color_description B3A06D yellow
    set fish_pager_color_selected_background --background=brblack
    set fish_pager_color_selected_prefix
    set fish_pager_color_selected_completion
    set fish_pager_color_selected_description
    set fish_pager_color_secondary_background
    set fish_pager_color_secondary_prefix
    set fish_pager_color_secondary_completion
    set fish_pager_color_secondary_description

# `dirh`
    set fish_color_history_current --bold

# ----------- Abbreviations ------------
    abbr -a d "doas"
    abbr -a nv "nvim"
    abbr -a snv "doasedit"
    abbr -a py "python"
    abbr -a ipy "ipython"
    abbr -a j "just"
    abbr -a n "nnn"

# -------------- Aliases ---------------
# Utilities
    alias sudo="doas"
    alias doasedit="~/scripts/doasedit.sh"
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

# Scripts
    alias besttime="~/scripts/besttime.sh"

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
    # TODO: Try the fish built in prompt functions.
    starship init fish | source

# A `cd` Command Alternative
    eval "$(zoxide init fish --cmd cd)"
end



# Make going up a number of directories easier
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd



# Sources:
#    https://github.com/PatrickF1/colored_man_pages.fish/blob/f885c2507128b70d6c41b043070a8f399988bc7a/functions/cless.fish#L2,L7
