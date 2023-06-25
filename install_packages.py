# /usr/bin/env python
"""Script to install system packages and initalize environment."""
import platform


if platform.freedesktop_os_release()["ID"] not in ("arch",):
    raise SystemExit("Error: Your linux distribution is not supported by this script.")

is_laptop = False


# Arch Linux
arch_groups = {
    "base-devel",
    "texlive",
}
arch_extra = {
    "alacritty",  # Terminal emulator
    "sqlitebrowser",
    "ghostwriter",  # For writing in Arabic smoothly
    "mpv",  # Media player
    "mpv-mpris",
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
    "rofi-calc",
    "rofi-emoji",
    "dunst",
    "clipmenu",
    "polkit-gnome",
    "flameshot",  # Screenshot Software
    "greetd",
    "greetd-tuigreet",
    "rsibreak",
    "hyprland",
    "xdg-desktop-portal-hyprland",
    "xdg-desktop-portal-gtk",
    "waybar",
    "swayidle",
    "swaylock",
    "swappy",  # Snapshot and Editor Tool
    "grim",  # Screenshot utility
    "slurp",  # Select a region in a Wayland
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
    "onefetch",  # Git Repo Summary
    "tokei",  # Statistics about your code
    "nvtop",  # GPUs Monitoring
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
    "lfs",
    "broot",
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
    "d-spy",
    "feh",  # Image viewer
    "swayimg",  # Image viewer
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
    "gnome-keyring",
    "noto-fonts",
    "noto-fonts-cjk",
    "noto-fonts-extra",
    "cantarell-fonts",
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
    "texlive-langother",
}
arch_core = {
    "dash",
    "python",
}
arch_user_repo = {
    "rofi-lbonn-wayland",  # Launcher
    "foxmarks",
    "autotiling",
    "swaync",
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
flathub = {
    "app.drey.Dialect",  # Translating Text
    "com.github.wwmm.easyeffects",  # Audio Manipulation
}

if is_laptop:
    arch_user_repo.add("slimbookbattery")  # Interface for TLP
    arch_extra.add("cbatticon")  # Battery System Tray Icon


pacman_install = f"sudo pacman -S --needed {' '.join(arch_core)} {' '.join(arch_extra)} {' '.join(arch_groups)}"

paru_install = f"paru -Sa --needed {' '.join(arch_user_repo)}"

flathub_install = f"flatpack install flathub {' '.join(flathub)}"

print(pacman_install, paru_install, flathub_install, sep="\n\n")

# TODO: Install paru if not existing.
# TODO: Install flatpak if not existing.
# TODO: Auto install pacman and paru packages.
# TODO: Autorun other commands to setup things.
