# zer0-x's public dotfiles
> Managed with [chezmoi](https://www.chezmoi.io/)

Those config files and dependencies represents my Personalized Development Environment.

## Dependencies

### GUI Applications
- [kitty](https://archlinux.org/packages/community/x86_64/kitty/) <sup>`Terminal emulator`</sup>
- [sqlitebrowser](https://archlinux.org/packages/community/x86_64/sqlitebrowser/)
- [qt5-tools](https://archlinux.org/packages/extra/x86_64/qt5-tools/)
- [ghostwriter](https://archlinux.org/packages/community/x86_64/ghostwriter/) <sup>`For writing in Arabic smoothly`</sup>
- [mpv](https://archlinux.org/packages/community/x86_64/mpv/) <sup>`Media player`</sup>
- [feh](https://archlinux.org/packages/extra/x86_64/feh/) <sup>`Image viewer`</sup>
- [qalculate-qt](https://archlinux.org/packages/extra/x86_64/qalculate-qt/)
- [zathura](https://archlinux.org/packages/community/x86_64/zathura/) <sup>`Document Viewer`</sup>
    - [zathura-pdf-mupdf](https://archlinux.org/packages/community/x86_64/zathura-pdf-mupdf/)
- [thunar](https://archlinux.org/packages/extra/x86_64/thunar/) <sup>`File Manager`</sup>
    - [gvfs](https://archlinux.org/packages/extra/x86_64/gvfs/)
    - [thunar-archive-plugin](https://archlinux.org/packages/extra/x86_64/thunar-archive-plugin/)
    - [thunar-media-tags-plugin](https://archlinux.org/packages/extra/x86_64/thunar-media-tags-plugin/)
    - [tumbler](https://archlinux.org/packages/extra/x86_64/tumbler/)
        - [ffmpegthumbnailer](https://archlinux.org/packages/extra/x86_64/ffmpegthumbnailer/)
        - [poppler-glib](https://archlinux.org/packages/extra/x86_64/poppler-glib/)
        - [libgsf](https://archlinux.org/packages/extra/x86_64/libgsf/)
- [slimbookbattery](https://aur.archlinux.org/packages/slimbookbattery) <sup>`Interface for TLP`</sup>
- [system-config-printer](https://archlinux.org/packages/extra/x86_64/system-config-printer/)
- [dialect](https://aur.archlinux.org/packages/dialect) <sup>`Translating Text`</sup>

### Desktop Environment
- [i3-gaps](https://archlinux.org/packages/community/x86_64/i3-gaps/) <sup>`Window Manager`</sup>
    - [autotiling](https://aur.archlinux.org/packages/autotiling)
    - [xorg-setxkbmap](https://archlinux.org/packages/extra/x86_64/xorg-setxkbmaps/) <sup>`Configure Keyboard`</sup>
    - [xorg-xset](https://archlinux.org/packages/extra/x86_64/xorg-xset/) <sup>`X11 Preference`</sup>
    - [xss-lock](https://archlinux.org/packages/community/x86_64/xss-lock/)
    - [i3lock](https://archlinux.org/packages/community/x86_64/i3lock/)
    - [xdotool](https://archlinux.org/packages/community/x86_64/xdotool/) <sup>`X11 Automation Tool`</sup>
    - [numlockx](https://archlinux.org/packages/community/x86_64/numlockx/) <sup>`X11 Turn on Numlock`</sup>
    - [nitrogen](https://archlinux.org/packages/extra/x86_64/nitrogen/) <sup>`X11 Background Setter`</sup>
    - [dex](https://archlinux.org/packages/community/x86_64/dex/) <sup>`XDG Auto Start / DesktopEntry`</sup>
- [polybar](https://archlinux.org/packages/community/x86_64/polybar/) <sup>`Status Bar / Panel`</sup>
    - [pamixer](https://archlinux.org/packages/community/x86_64/pamixer/) <sup>`CLI Audio Mixer`</sup>
    - [psmisc](https://archlinux.org/packages/core/x86_64/psmisc/) <sup>`Check for /dev/video* usage with (fuser)`</sup>
    - [cbatticon](https://archlinux.org/packages/community/x86_64/cbatticon/) <sup>`Battery System Tray Icon`</sup>
    - [brightnessctl](https://archlinux.org/packages/community/x86_64/brightnessctl/)
- [picom](https://archlinux.org/packages/community/x86_64/picom/) <sup>`X11 Compositor`</sup>
- [redshift](https://archlinux.org/packages/community/x86_64/redshift/) <sup>`X11 Adjust Screen Temperature`</sup>
- [rofi](https://archlinux.org/packages/community/x86_64/rofi/) <sup>`Launcher`</sup>
    - [rofi-calc](https://archlinux.org/packages/community/x86_64/rofi-calc/)
    - [rofi-emoji](https://archlinux.org/packages/community/x86_64/rofi-emoji/)
    - [foxmarks](https://aur.archlinux.org/packages/foxmarks)
- [deadd-notification-center](https://aur.archlinux.org/packages/deadd-notification-center) <sup>`Notification Center`</sup>
- [clipcat](https://aur.archlinux.org/packages/clipcat) <sup>`Clipboard Manager`</sup> <sup>`(Need an alternative)`</sup>
- [network-manager-applet](https://archlinux.org/packages/extra/x86_64/network-manager-applet/)
- [kwallet](https://archlinux.org/packages/extra/x86_64/kwallet/)
    - [kwallet-pam](https://archlinux.org/packages/extra/x86_64/kwallet-pam/)
- [flameshot](https://archlinux.org/packages/community/x86_64/flameshot/) <sup>`Screenshot Software`</sup>
- [lightdm](https://archlinux.org/packages/extra/x86_64/lightdm/)
    - [lightdm-gtk-greeter](https://archlinux.org/packages/extra/x86_64/lightdm-gtk-greeter/)
    - [lightdm-gtk-greeter-settings](https://archlinux.org/packages/extra/x86_64/lightdm-gtk-greeter-settings/)
- [rsibreak](https://archlinux.org/packages/community/x86_64/rsibreak/)


### Fonts
- [noto-fonts](https://archlinux.org/packages/extra/any/noto-fonts/)
- [JetBrainsMono Nerd](https://aur.archlinux.org/packages/nerd-fonts-jetbrains-mono)
- [nerd-fonts-ubuntu](https://aur.archlinux.org/packages/nerd-fonts-ubuntu)
- [ttf-dejavu-ib](https://aur.archlinux.org/packages/ttf-dejavu-ib) <sup>`Better Arabic Fonts in UI`</sup>

### Themes
#### Icons
- [papirus-icon-theme](https://archlinux.org/packages/community/any/papirus-icon-theme/)
    - [papirus-folders](https://aur.archlinux.org/packages/papirus-folders)
    - [hardcode-tray](https://aur.archlinux.org/packages/hardcode-tray)
- [adwaita-icon-theme](https://archlinux.org/packages/extra/any/adwaita-icon-theme/)
#### UI
- [qt5ct](https://archlinux.org/packages/community/x86_64/qt5ct/) <sup>`Qt5 Configuration Utility`</sup>
- [qt6ct](https://archlinux.org/packages/community/x86_64/qt6ct/) <sup>`Qt6 Configuration Utility`</sup>
- [kvantum](https://archlinux.org/packages/community/x86_64/kvantum/) <sup>`Theme Engine for Qt5/6`</sup>
- [libadwaita](https://archlinux.org/packages/extra/x86_64/libadwaita/)

Fix hardcoded tray icons:
```shell
sudo -E hardcode-tray --theme Papirus-Dark
```

Change the folders color:
```shell
papirus-folders -C teal --theme Papirus-Dark
```

Set the Qt5 theme by adding this line: `QT_QPA_PLATFORMTHEME=qt5ct` to your `/etc/environment` file.

Prefer dark theme for GTK-4:
```shell
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

### CLI Applications/Tools
- [git](https://archlinux.org/packages/extra/x86_64/git/)
- [python-livereload](https://archlinux.org/packages/community/any/python-livereload/)
- [libqalculate](https://archlinux.org/packages/extra/x86_64/libqalculate/)
- [xclip](https://archlinux.org/packages/extra/x86_64/xclip/) <sup>`Access clipborad for x11`</sup>
- [wl-clipboard](https://archlinux.org/packages/community/x86_64/wl-clipboard/) <sup>`Access clipboard for wayland`</sup>
- [trash-cli](https://archlinux.org/packages/community/any/trash-cli/)
    - [rmtrash](https://aur.archlinux.org/packages/rmtrash)
- [pulsemixer](https://archlinux.org/packages/community/any/pulsemixer/) <sup>`TUI Audio Mixer`</sup>
- [onefetch](https://archlinux.org/packages/community/x86_64/onefetch/) <sup>`Git Repo Summary`</sup>
- [nvtop](https://archlinux.org/packages/community/x86_64/nvtop/) <sup>`GPUs Monitoring`</sup>
- [htop](https://archlinux.org/packages/extra/x86_64/htop/) <sup>`System Monitoring`</sup>
- [nnn](https://archlinux.org/packages/community/x86_64/nnn/) <sup>`TUI File Manager`</sup>
- [dragon-drop](https://aur.archlinux.org/packages/dragon-drop) <sup>`CLI-GUI drag-and-drop source/target`</sup>

### CLI Utilities
- [bat](https://archlinux.org/packages/community/x86_64/bat/)
- [fd](https://archlinux.org/packages/community/x86_64/fd/) <sup>`find alternative`</sup>
- [zoxide](https://archlinux.org/packages/community/x86_64/zoxide/) <sup>`cd alternative`</sup>
- [exa](https://archlinux.org/packages/community/x86_64/exa/) <sup>`ls alternative`</sup>
- [fzf](https://archlinux.org/packages/community/x86_64/fzf/) <sup>`fuzzy finder`</sup>

### Shell
- [zsh](https://archlinux.org/packages/extra/x86_64/zsh/)
    - [zsh-autosuggestions](https://archlinux.org/packages/community/any/zsh-autosuggestions/)
    - [zsh-completions](https://archlinux.org/packages/community/any/zsh-completions/)
    - [zsh-history-substring-search](https://archlinux.org/packages/community/any/zsh-history-substring-search/)
    - [zsh-syntax-highlighting](https://archlinux.org/packages/community/any/zsh-syntax-highlighting/)
    - [zsh-theme-powerlevel10k](https://archlinux.org/packages/community/x86_64/zsh-theme-powerlevel10k/)


### NeoVim <sup>`Text Editor`</sup>
- [neovim](https://archlinux.org/packages/community/x86_64/neovim/)
- [nvim packer](https://aur.archlinux.org/packages/nvim-packer-git)

After installing packer, you need to install the plugins for neovim by running:
```
:PackerSync
```

#### sup-dependencies <sup>`Required by NeoVim plugins`</sup>
- [ripgrep](https://archlinux.org/packages/community/x86_64/ripgrep/)

### Language Servers
- [rust-analyzer](https://archlinux.org/packages/community/x86_64/rust-analyzer/) <sup>`Rust`</sup>
- [jedi-language-server](https://archlinux.org/packages/community/any/jedi-language-server/) <sup>`Python`</sup>
- [texlab](https://archlinux.org/packages/community/x86_64/texlab/) <sup>`LaTex`</sup>
- [typescript-language-server](https://archlinux.org/packages/community/any/typescript-language-server/) <sup>`JavaScript/TypeScript`</sup>
- [vscode-css-languageserver](https://archlinux.org/packages/community/any/vscode-css-languageserver/) <sup>`CSS`</sup>
- [vscode-html-languageserver](https://archlinux.org/packages/community/any/vscode-html-languageserver/) <sup>`HTML`</sup>
- [lua-language-server](https://archlinux.org/packages/community/x86_64/lua-language-server/) <sup>`Lua`</sup>

### Linters
- [flawfinder](https://archlinux.org/packages/community/any/flawfinder/) <sup>`C/C++`</sup>
- [mypy](https://archlinux.org/packages/community/any/mypy/) <sup>`Python`</sup>
- [flake8](https://archlinux.org/packages/community/any/flake8/) <sup>`Python`</sup>
    - [pep8-naming](https://aur.archlinux.org/packages/python-pep8-naming)
    - [flake8-builtins](https://aur.archlinux.org/packages/python-flake8-builtins)
    - [flake8-comprehensions](https://aur.archlinux.org/packages/python-flake8-comprehensions)
    - [flake8-bugbear](https://aur.archlinux.org/packages/python-flake8-bugbear)
- [python-pydocstyle](https://archlinux.org/packages/community/any/python-pydocstyle/) <sup>`Python`</sup>
- [Bandit](https://archlinux.org/packages/community/any/bandit/) <sup>`Python`</sup>
- [selene-linter](https://archlinux.org/packages/community/x86_64/selene-linter/) <sup>`Lua`</sup>
- [eslint](https://archlinux.org/packages/community/any/eslint/) <sup>`JavaScript/TypeScript`</sup>
- [stylelint](https://archlinux.org/packages/community/any/stylelint/) <sup>`CSS`</sup>
- [tidy](https://archlinux.org/packages/extra/x86_64/tidy/) <sup>`HTML`</sup>

### Formatters
- [black](https://archlinux.org/packages/community/any/python-black/) <sup>`Python`</sup>
- [stylua](https://archlinux.org/packages/community/any/stylua/) <sup>`Lua`</sup>
- [shfmt](https://archlinux.org/packages/community/any/shfmt/) <sup>`shell`</sup>

### Programming Languages Tools/Compilers/Interpreters
#### Rust
- [rustup](https://archlinux.org/packages/community/x86_64/rustup/)

After installing it you need to run:
```shell
rustup default stable
```

> **Note** It includes most the tools used for the Rust language.

#### C/C++
- [base-devel](https://archlinux.org/groups/x86_64/base-devel/)
- [clang](https://archlinux.org/packages/extra/x86_64/clang/)

#### Python
- [python](https://archlinux.org/packages/core/x86_64/python/)

#### LaTex
- [texlive-most](https://archlinux.org/groups/x86_64/texlive-most/)
- [texlive-langextra](https://archlinux.org/packages/extra/any/texlive-langextra/)
- [texlive-fontsextra](https://archlinux.org/packages/extra/any/texlive-fontsextra/)

## Arch linux Installation
<!-- TODO: Create an inatall script. -->

In your shell, run:
```shell
sudo pacman -S --needed ripgrep fd clang rustup jedi-language-server texlab typescript-language-server vscode-css-languageserver vscode-html-languageserver lua-language-server flawfinder mypy flake8 python-pydocstyle selene-linter eslint stylelint tidy texlive-most texlive-langextra texlive-fontsextra ghostwriter kitty mpv feh zsh bandit bat qalculate-qt libqalculate rust-analyzer python-black exa zoxide zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k zathura-pdf-mupdf zathura rofi rofi-calc rofi-emoji trash-cli thunar i3-gaps xorg-setxkbmap xorg-xset xss-lock xdotool numlockx nitrogen dex polybar pamixer psmisc picom network-manager-applet kwallet kwallet-pam flameshot pulsemixer stylua shfmt redshift lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings fzf onefetch nvtop htop papirus-icon-theme base-devel rsibreak qt5ct qt6ct kvantum adwaita-icon-theme libadwaita brightnessctl qt5-tools

rustup default stable
```

Now you need [`paur`](https://github.com/Morganamilo/paru#installation) to install AUR packages.

```shell
paru -Sa --needed nvim-packer-git python-flake8-builtins python-flake8-bugbear python-flake8-comprehensions python-pep8-naming nerd-fonts-jetbrains-mono foxmarks rmtrash autotiling deadd-notification-center clipcat slimbookbattery papirus-folders hardcode-tray dialect nerd-fonts-ubuntu ttf-dejavu-ib dragon-drop
```

Then inside neovim, run:
```
:PackerSync
```

<!-- TODO: Create screenshots section. -->
