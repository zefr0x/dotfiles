# Python virtual environments manager with `uv venv` for the Fish shell.
#
# Inspired by:
#   https://github.com/justinmayer/virtualfish

function vf
    set vf_home $XDG_DATA_HOME/virtualenvs

    if test (count $argv) -lt 1
        printf "You need to specify a command.\n"
        return 1
    else if [ $argv[1] = activate ]
        if [ (count $argv) -lt 2 ]
            printf "You need to specify a virtualenv.\n"
            return 1
        end
        if not [ -d $vf_home/$argv[2] ]
            printf "The virtualenv `$(tput setaf 3)$argv[2]$(tput sgr0)` does not exist.\n"
            printf "You can create it with `$(tput setaf 2)\$ vf new $argv[2]$(tput sgr0)`.\n"
            return 2
        end

        # Check if a different venv is currently active.
        if set -q virtual_env
            vf deactivate
        end

        . $vf_home/$argv[2]/bin/activate.fish

        set -g virtual_env $vf_home/$argv[2]
    else if [ $argv[1] = temp ]
        set dir "$(mktemp -d -t vf.XXXXXXXXXX)"

        uv venv $dir

        . $dir/bin/activate.fish

        set -g virtual_env $dir
    else if [ $argv[1] = deactivate ]
        if not set -q virtual_env
            printf "No virtualenv is currently active.\n"
            return
        end

        deactivate

        # If a temp venv was used, delete it.
        if string match -q "/tmp/vf.*" $virtual_env
            rm -rf $virtual_env
        end

        set --erase virtual_env
    else if [ $argv[1] = new ]
        if [ (count $argv) -lt 2 ]
            printf "You need to specify a virtualenv.\n"
            return 1
        end
        # TODO: Handle spaces in venv name/id.
        if [ -d $vf_home/$argv[2] ]
            printf "The virtualenv `$(tput setaf 3)$argv[2]$(tput sgr0)` already exist.\n"
            return 17
        end

        uv venv $vf_home/$argv[2]
        vf activate $argv[2]
    else if [ $argv[1] = rm ]
        if [ (count $argv) -lt 2 ]
            printf "You need to specify a virtualenv.\n"
            return 1
        end
        if not [ -d $vf_home/$argv[2] ]
            printf "The virtualenv `$(tput setaf 3)$argv[2]$(tput sgr0)` doesn't exist.\n"
            return 2
        end

        # Check if it is being currently used and deactivate it.
        if [ "$virtual_env" = "$vf_home/$argv[2]" ]
            vf deactivate
        end

        del $vf_home/$argv[2]
    else if [ $argv[1] = ls ]
        /bin/ls $vf_home
    else
        printf "`$(tput setaf 2)$argv[1]$(tput sgr0)` is not a valid command.\n"
        return 1
    end
end

####################
# Auto Completions #
####################

function __vfcompletion_needs_command
    set cmd (commandline -opc)
    if test (count $cmd) -eq 1 -a $cmd[1] = vf
        return 0
    end
    return 1
end

function __vfcompletion_using_command
    set cmd (commandline -opc)
    if test (count $cmd) -eq 2
        if test $argv[1] = $cmd[2]
            return 0
        end
    end
    return 1
end

complete --exclusive --command vf -d "Manage python venvs"

complete --command vf --condition __vfcompletion_needs_command --arguments activate -d "Activate a venv"
complete --command vf --condition __vfcompletion_needs_command --arguments temp -d "Create a temp venv"
complete --command vf --condition __vfcompletion_needs_command --arguments deactivate -d "Deactivate the current venv"
complete --command vf --condition __vfcompletion_needs_command --arguments new -d "Create a new venv"
complete --command vf --condition __vfcompletion_needs_command --arguments rm -d "Delete a venv"
complete --command vf --condition __vfcompletion_needs_command --arguments ls -d "List available venvs"

complete --command vf --condition '__vfcompletion_using_command activate' --arguments "$(vf ls)"
complete --command vf --condition '__vfcompletion_using_command rm' --arguments "$(vf ls)"
