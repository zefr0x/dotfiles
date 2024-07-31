# /usr/bin/env python
"""Script to install system packages and initalize environment."""

import platform

if platform.freedesktop_os_release()["ID"] not in ("arch",):
    err_msg = "Error: Your linux distribution is not supported by this script."
    raise SystemExit(err_msg)


# Arch Linux
arch_groups = {
    "base-devel",
    "texlive",
}
arch_extra = {
    "alacritty",  # Terminal emulator
    "sqlitebrowser",
    "mpv",  # Media player
    "mpv-mpris",
    "zathura",  # Document Viewer
    "zathura-pdf-mupdf",
    "dex",  # XDG Auto Start / DesktopEntry
    "rofi-emoji",
    "polkit-gnome",
    "greetd",
    "greetd-tuigreet",
    "hyprland",
    "xdg-desktop-portal-hyprland",
    "xdg-desktop-portal-gtk",
    "waybar",
    "hypridle",
    "hyprlock",
    "grim",  # Screenshot utility
    "slurp",  # Select a region in a Wayland
    "ttf-firacode-nerd",
    "ttf-ubuntu-nerd",
    "papirus-icon-theme",
    "kvantum",  # Theme Engine for Qt6
    "git-delta",  # Syntax-highlighting pager for git, diff, and grep output
    "python-livereload",
    "wl-clipboard",  # Access clipboard for wayland
    "trash-cli",
    "onefetch",  # Git Repo Summary
    "tokei",  # Statistics about your code
    "nvtop",  # GPUs Monitoring
    "just",  # Command runner
    "hyperfine",  # command-line benchmarking tool
    "less",
    "jless",
    "bat",
    "fd",  # `find` alternative
    "zoxide",  # `cd` alternative
    "eza",  # `ls` alternative
    "hexyl",  # command-line hex viewer
    "skim",  # fuzzy finder
    "handlr-regex",  # Alternative to xdg-utils
    "fish",
    "neovim",
    "ripgrep",
    "dysk",
    "broot",
    "opendoas",
    "texlab",
    "vscode-css-languageserver",
    "vscode-html-languageserver",
    "lua-language-server",
    "vscode-json-languageserver",
    "yaml-language-server",
    "flawfinder",
    "mold",
    "deno",
    "swayimg",  # Image viewer
    "pcmanfm-qt",  # File Manager
    "gvfs",
    "rofi-wayland",  # Launcher
    # "system-config-printer",
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
    "pastel",
    "htop",  # System Monitoring
    "bandwhich",  # Network Bandwidth Monitoring
    "imagemagick",
    "stylua",
    "shfmt",
    "rustup",
    "cargo-outdated",
    "cargo-bloat",
    "cargo-nextest",
    "cargo-show-asm",
    "cargo-depgraph",
    "cargo-supply-chain",
    "cargo-deny",
    "cargo-sort",
    "clang",
    "uv",
    "python-lsp-server",
    "ruff",
    "mypy",
    "go",
    "gopls",
    "go-tools",
    "texlive-langarabic",
    "texlive-langother",
    "jdk-openjdk",
    "jdk21-openjdk",
    "gradle",
}
arch_core = {
    "dash",
    "python",
}
arch_user_repo = {
    "foxmarks",
    "hyprland-per-window-layout",
    "hyprpicker",
    "wl-gammarelay-rs",
    "satty",
    "swaync",
    "ianny-git",  # Periodically informes user to take breaks
    "ttf-dejavu-ib",  # Better Arabic Fonts in UI
    "ttf-amiri",
    "ripdrag-git",  # CLI-GUI drag-and-drop source/target
    "fish-tide-git",
    "nodejs-emmet-ls",
    "jdtls",
    "melody",
}
flathub = {
    "org.gnome.dspy",  # D-Bus connections explorer
    "com.github.wwmm.easyeffects",  # Audio Manipulation
    "org.pipewire.Helvum",  # D-Bus connections explorer
    "io.github.Qalculate",  # Qalculate! GTK+ UI
    "app.drey.Dialect",  # Translating Text
    "org.gnome.seahorse.Application",  # Frontend for gnome-keyring
    "org.gnome.TextEditor",  # For writing in Arabic smoothly
    "org.gnome.Gtranslator",  # Gettext po file editor
    "io.github.finefindus.Hieroglyphic",  # Find LaTeX symbols
}


print(
    "sudo pacman -S --needed "
    + " ".join(arch_core.union(arch_extra).union(arch_groups)),
    "yay -Sa --needed " + " ".join(arch_user_repo),
    "flatpack install flathub " + " ".join(flathub),
    sep="\n\n",
)

# TODO: Install yay or paru if not existing.
# TODO: Install flatpak if not existing.
# TODO: Auto install pacman and AUR packages.
# TODO: Autorun other commands to setup things.
