# /usr/bin/env python
"""Script to install system packages and initalize environment."""
import platform


if platform.freedesktop_os_release()["ID"] not in ("arch",):
    raise SystemExit("Error: Your linux distribution is not supported by this script.")

is_laptop = False


# Arch Linux
arch_groups = {
    "base-devel",
    "texlive-most",
}
arch_community = {
    "kitty",  # Terminal emulator
    "sqlitebrowser",
    "ghostwriter",  # For writing in Arabic smoothly
    "mpv",  # Media player
    "zathura",  # Document Viewer
    "zathura-pdf-mupdf",
    "i3-gaps",  # Window Manager
    "xss-lock",
    "xsecurelock",
    "xdotool",  # X11 Automation Tool
    "numlockx",  # X11 Turn on Numlock
    "dex",  # XDG Auto Start / DesktopEntry
    "polybar",  # Status Bar / Panel
    "pamixer",  # CLI Audio Mixer
    "brightnessctl",
    "picom",  # X11 Compositor
    "redshift",  # X11 Adjust Screen Temperature
    "rofi",  # Launcher
    "rofi-calc",
    "rofi-emoji",
    "dunst",
    "clipmenu",
    "lxsession-gtk3",
    "flameshot",  # Screenshot Software
    "rsibreak",
    "ttf-jetbrains-mono-nerd",
    "ttf-ubuntu-nerd",
    "papirus-icon-theme",
    "qt5ct",  # Qt5 Configuration Utility
    "qt6ct",  # Qt6 Configuration Utility
    "kvantum",  # Theme Engine for Qt5/6
    "git-delta",  # Syntax-highlighting pager for git, diff, and grep output
    "python-livereload",
    # "wl-clipboard",  # Access clipboard for wayland
    "trash-cli",
    "pulsemixer",  # TUI Audio Mixer
    "onefetch",  # Git Repo Summary
    "tokei",  # Statistics about your code
    "nvtop",  # GPUs Monitoring
    "nnn",  # TUI File Manager
    "just",  # Command runner
    "hyperfine",  # command-line benchmarking tool
    "jless",
    "bat",
    "fd",  # `find` alternative
    "zoxide",  # `cd` alternative
    "exa",  # `ls` alternative
    "hexyl",  # command-line hex viewer
    "fzf",  # fuzzy finder
    # TODO: "skim",  # fuzzy finder
    "handlr",  # Alternative to xdg-utils
    "fish",
    "neovim",
    "ripgrep",
    "opendoas",
    "python-lsp-server",
    "python-lsp-black",
    "texlab",
    "vscode-css-languageserver",
    "vscode-html-languageserver",
    "lua-language-server",
    "vscode-json-languageserver",
    "yaml-language-server",
    "flawfinder",
    "mypy",
    "flake8",
    "python-pydocstyle",
    "bandit",
    "selene-linter",
    "stylelint",
    "mold",
    "deno",
}
arch_extra = {
    "d-spy",
    "feh",  # Image viewer
    "qalculate-qt",
    "thunar",  # File Manager
    "gvfs",
    "thunar-archive-plugin",
    "thunar-media-tags-plugin",
    "tumbler",
    "ffmpegthumbnailer",
    "poppler-glib",
    "libgsf",
    # "system-config-printer",
    "xorg-setxkbmap",  # Configure Keyboard
    "xorg-xset",  # X11 Preference
    "lsof",  # Check for /dev/video* usage with (fuser)
    "network-manager-applet",
    "kwallet",
    "kwallet-pam",
    "noto-fonts",
    "noto-fonts-cjk",
    "noto-fonts-extra",
    "adwaita-icon-theme",
    "libadwaita",
    "git",
    "libqalculate",
    "xclip",  # Access clipborad for x11
    "htop",  # System Monitoring
    "tidy",
    "python-black",
    "stylua",
    "shfmt",
    "rustup",
    "clang",
    "texlive-langextra",
    "texlive-fontsextra",
    "meld",  # Visual diff and merge tool
}
arch_core = {
    "dash",
    "python",
}
arch_user_repo = {
    "dialect",  # Translating Text
    "autotiling",
    "foxmarks",
    "greetd",
    "greetd-tuigreet",
    "ttf-dejavu-ib",  # Better Arabic Fonts in UI
    "dragon-drop",  # CLI-GUI drag-and-drop source/target
    "fish-tide-git",
    "fish-fzf",
    "bass-fish",
    "virtualfish",
    "nvim-packer-git",
    "nodejs-emmet-ls",
    "jdtls",
    "python-pep8-naming",
    "python-flake8-builtins",
    "python-flake8-comprehensions",
    "python-flake8-bugbear",
    "melody",
}

if is_laptop:
    arch_user_repo.add("slimbookbattery")  # Interface for TLP
    arch_community.add("cbatticon")  # Battery System Tray Icon


pacman_install = f"sudo pacman -S --needed {' '.join(arch_core)} {' '.join(arch_extra)} {' '.join(arch_community)} {' '.join(arch_groups)}"

paru_install = f"paru -Sa --needed {' '.join(arch_user_repo)}"

print(pacman_install)
print()
print(paru_install)

# TODO: Install paru if not existing.
# TODO: Auto install pacman and paru packages.
# TODO: Autorun other commands to setup things.
