set fish_greeting

# ------------- Variables --------------
set -x EDITOR nvim
set -x VISUAL nvim
if [ $TERM = xterm-kitty ]
    set -x TERMINAL kitty
else if [ $TERM = alacritty ]
    set -x TERMINAL alacritty
end
set -x VIDEO mpv
set -x IMAGE swayimg
set -x OPENER "gio open"

# ------------ Tools Config ------------

# Color `man` Pages
set -x LESS_TERMCAP_md (set_color --bold 0280A5) # start bold
set -x LESS_TERMCAP_me (set_color normal) # end bold
set -x LESS_TERMCAP_us (set_color --underline 5BA502) # start underline
set -x LESS_TERMCAP_ue (set_color normal) # end underline
set -x LESS_TERMCAP_so (set_color --reverse F0CB02) # start standout
set -x LESS_TERMCAP_se (set_color normal) # end standout

# `less`
set -x LESS -R

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
    abbr -a d doas
    abbr -a hx helix
    abbr -a nv nvim
    abbr -a snv doasedit
    abbr -a py python
    abbr -a j just
    abbr -a b br
    abbr -a g git
    abbr -a p pacman
    abbr -a dp doas pacman
    abbr -a pu doas pacman -Syu
    abbr -a yu yay -Syua
    abbr -a fu flatpak update

    # -------------- Aliases ---------------
    # Utilities
    alias sudo="doas"
    alias doasedit="~/.scripts/doasedit.sh"
    alias cp="cp -i"
    alias df="df -h"
    alias free="free -m"
    alias grep="grep --colour=auto"
    alias ip="ip -color=auto"
    alias img="swayimg"
    alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
    alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
    alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"

    alias ls="eza --icons --hyperlink"
    alias ll="ls -l"
    alias la="ls -la"
    alias lt="ls --tree --git-ignore"

    # Tools
    alias topdf="org.libreoffice.LibreOffice --headless --invisible --convert-to pdf"
    alias qalc="flatpak run --command=qalc io.github.Qalculate -s 'exp 0'"
    alias now="date +'%A %d/%m/%Y %H:%M:%S.%N (%Z) %nUnix time: %s'"
    function hex
        hexdump -C $argv | less
    end

    # Scripts
    # ...

    # To not shoot my self in the leg
    alias rm="echo -e Use the \`del\` command, unable to delete: "
    alias del="gio trash"

    # Drag to and from Aliases
    alias dragto="ripdrag"
    alias dragon="ripdrag --target --and-exit"

    # Kitty specific aliases
    if [ $TERM = xterm-kitty ]
        alias ssh="env TERM=xterm-256color ssh"
        alias icat="kitty +kitten icat"
        alias rg="rg --hyperlink-format=kitty"
    end

    # ------------ Shell Things ------------
    # A `cd` Command Alternative
    zoxide init fish --cmd cd | source

    # Fuzzy Finder
    skim_key_bindings

    # The broot file browser
    function br --wraps=broot
        set -l cmd_file (mktemp)
        if broot --outcmd $cmd_file $argv
            read --local --null cmd <$cmd_file
            command rm -f $cmd_file
            eval $cmd
        else
            set -l code $status
            command rm -f $cmd_file
            return $code
        end
    end

    # Make going up a number of directories easier
    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd
end

# Sources:
#    https://github.com/Canop/broot
#    https://github.com/PatrickF1/colored_man_pages.fish/blob/f885c2507128b70d6c41b043070a8f399988bc7a/functions/cless.fish#L2,L7
