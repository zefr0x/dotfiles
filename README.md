# zer0-x's public dotfiles
> Managed with [chezmoi](https://www.chezmoi.io/)

Those config files represents my Personalized Environment.

<details>
<summary>Dependencies</summary>

### GUI Applications
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [sqlitebrowser](https://sqlitebrowser.org/)
- [Qt5 Tools](https://archlinux.org/packages/extra/x86_64/qt5-tools/)
- [ghostwriter](https://ghostwriter.kde.org/)
- [mpv](https://mpv.io/)
- [feh](https://feh.finalrewind.org/)
- [Qalculate! Qt](https://qalculate.github.io/)
- [zathura](https://pwmt.org/projects/zathura/)
    - [zathura-pdf-mupdf](https://pwmt.org/projects/zathura-pdf-mupdf/)
- [thunar](https://docs.xfce.org/xfce/thunar/start)
    - [gvfs](https://wiki.gnome.org/Projects/gvfs)
    - [thunar-archive-plugin](https://docs.xfce.org/xfce/thunar/archive)
    - [thunar-media-tags-plugin](https://docs.xfce.org/xfce/thunar/media-tags)
    - [tumbler](https://docs.xfce.org/xfce/tumbler/start)
        - [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
        - [poppler-glib](https://poppler.freedesktop.org/)
        - [libgsf](https://www.digital-scurf.org/software/libgfshare)
- [slimbookbattery](https://github.com/slimbook/slimbookbattery)
- [system-config-printer](https://github.com/OpenPrinting/system-config-printer)
- [dialect](https://apps.gnome.org/app/app.drey.Dialect/)
- [Meld](https://meldmerge.org/)


### Desktop Environment
- [i3-gaps](https://github.com/Airblader/i3)
    - [autotiling](https://github.com/nwg-piotr/autotiling)
    - [xorg-setxkbmap](https://archlinux.org/packages/extra/x86_64/xorg-setxkbmap/)
    - [xorg-xset](https://archlinux.org/packages/extra/x86_64/xorg-xset/)
    - [xss-lock](https://bitbucket.org/raymonad/xss-lock)
    - [i3lock](https://i3wm.org/i3lock/)
    - [xdotool](https://www.semicomplete.com/projects/xdotool/)
    - [numlockx](https://github.com/rg3/numlockx)
    - [nitrogen](http://projects.l3ib.org/nitrogen/)
    - [dex](https://github.com/jceb/dex)
- [polybar](https://github.com/polybar/polybar)
    - [pamixer](https://github.com/cdemoulins/pamixer)
    - [psmisc](https://gitlab.com/psmisc/psmisc)
    - [cbatticon](https://github.com/valr/cbatticon)
    - [brightnessctl](https://github.com/Hummer12007/brightnessctl)
- [picom](https://github.com/yshui/picom)
- [redshift](http://jonls.dk/redshift/)
- [rofi](https://github.com/DaveDavenport/rofi)
    - [rofi-calc](https://github.com/svenstaro/rofi-calc)
    - [rofi-emoji](https://github.com/Mange/rofi-emoji)
    - [foxmarks](https://github.com/zer0-x/foxmarks)
- [deadd-notification-center](https://github.com/phuhl/linux_notification_center)
- [clipcat](https://github.com/xrelkd/clipcat)
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [kwallet](https://archlinux.org/packages/extra/x86_64/kwallet/)
    - [kwallet-pam](https://archlinux.org/packages/extra/x86_64/kwallet-pam/)
- [flameshot](https://github.com/flameshot-org/flameshot)
- [lightdm](https://github.com/canonical/lightdm)
    - [lightdm-gtk-greeter](https://github.com/Xubuntu/lightdm-gtk-greeter)
    - [lightdm-gtk-greeter-settings](https://github.com/Xubuntu/lightdm-gtk-greeter-settings)
- [rsibreak](https://apps.kde.org/rsibreak/)


### Fonts
- [noto-fonts](https://fonts.google.com/noto)
- [JetBrainsMono Nerd](https://www.nerdfonts.com/)
- [nerd-fonts-ubuntu](https://github.com/ryanoasis/nerd-fonts)
- [ttf-dejavu-ib](http://dejavu-fonts.org/wiki/Main_Page)

### Themes
#### Icons
- [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
    - [papirus-folders](https://github.com/PapirusDevelopmentTeam/papirus-folders)
    - [hardcode-tray](https://github.com/bil-elmoussaoui/Hardcode-Tray)
- [adwaita-icon-theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme)
#### UI
- [qt5ct](https://sourceforge.net/projects/qt5ct/)
- [qt6ct](https://github.com/trialuser02/qt6ct)
- [kvantum](https://github.com/tsujan/Kvantum)
- [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/)

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
- [git](https://git-scm.com/)
- [python-livereload](https://github.com/lepture/python-livereload)
- [libqalculate](https://qalculate.github.io/)
- [xclip](https://github.com/astrand/xclip)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [trash-cli](https://github.com/andreafrancia/trash-cli)
    - [rmtrash](https://github.com/PhrozenByte/rmtrash)
- [pulsemixer](https://github.com/GeorgeFilipkin/pulsemixer)
- [onefetch](https://github.com/o2sh/onefetch)
- [nvtop](https://github.com/Syllo/nvtop)
- [htop](https://htop.dev/)
- [nnn](https://github.com/jarun/nnn)
- [dragon-drop](https://github.com/mwh/dragon)
- [difftastic](https://difftastic.wilfred.me.uk/)

### CLI Utilities
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [exa](https://the.exa.website/)
- [fzf](https://github.com/junegunn/fzf)
- [handlr](https://github.com/chmln/handlr)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

### Shell
- [zsh](https://www.zsh.org/)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-completions](https://github.com/zsh-users/zsh-completions)
    - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [zsh-theme-powerlevel10k](https://github.com/romkatv/powerlevel10k)


### NeoVim <sup>`Text Editor`</sup>
- [neovim](https://neovim.io/)

After installing, you need to install the plugins for neovim by running:
```
:Lazy install
:Lazy restore
```

### Language Servers
- [rust-analyzer](https://rust-analyzer.github.io/) <sup>`Rust`</sup>
- [jedi-language-server](https://github.com/pappasam/jedi-language-server) <sup>`Python`</sup>
- [texlab](https://github.com/latex-lsp/texlab) <sup>`LaTex`</sup>
- [typescript-language-server](https://github.com/theia-ide/typescript-language-server) <sup>`JavaScript/TypeScript`</sup>
- [vscode-css-languageserver](https://github.com/microsoft/vscode/tree/main/extensions/css-language-features/server) <sup>`CSS`</sup>
- [vscode-html-languageserver](https://github.com/microsoft/vscode/tree/main/extensions/html-language-features/server) <sup>`HTML`</sup>
- [emmet-ls](https://github.com/aca/emmet-ls) <sup>`HTML5/CSS3 snippets`</sup>
- [lua-language-server](https://github.com/sumneko/lua-language-server) <sup>`Lua`</sup>
- [yaml-language-server](https://github.com/redhat-developer/yaml-language-server) <sup>`YAML`</sup>

### Linters
- [flawfinder](https://dwheeler.com/flawfinder/) <sup>`C/C++`</sup>
- [mypy](http://www.mypy-lang.org/) <sup>`Python`</sup>
- [flake8](https://flake8.pycqa.org/) <sup>`Python`</sup>
    - [pep8-naming](https://github.com/PyCQA/pep8-naming)
    - [flake8-builtins](https://github.com/gforcada/flake8-builtins)
    - [flake8-comprehensions](https://github.com/adamchainz/flake8-comprehensions)
    - [flake8-bugbear](https://github.com/PyCQA/flake8-bugbear)
- [python-pydocstyle](http://www.pydocstyle.org/) <sup>`Python`</sup>
- [Bandit](https://github.com/PyCQA/bandit) <sup>`Python`</sup>
- [selene-linter](https://github.com/Kampfkarren/selene) <sup>`Lua`</sup>
- [eslint](https://eslint.org/) <sup>`JavaScript/TypeScript`</sup>
- [stylelint](https://stylelint.io/) <sup>`CSS`</sup>
- [tidy](https://www.html-tidy.org/) <sup>`HTML`</sup>

### Formatters
- [black](https://github.com/psf/black) <sup>`Python`</sup>
- [stylua](https://github.com/JohnnyMorganz/StyLua) <sup>`Lua`</sup>
- [shfmt](https://github.com/mvdan/sh) <sup>`shell`</sup>

### Programming Languages Tools/Compilers/Interpreters
#### Rust
- [rustup](https://github.com/rust-lang/rustup.rs)

After installing it you need to run:
```shell
rustup default stable
```

> **Note** It includes most the tools used for the Rust language.

#### C/C++
- [base-devel](https://archlinux.org/groups/x86_64/base-devel/)
- [clang](https://clang.llvm.org/)

#### Python
- [python](https://www.python.org/)
- [python-virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/)

#### LaTex
- [texlive-most](https://archlinux.org/groups/x86_64/texlive-most/)
- [texlive-langextra](https://archlinux.org/packages/extra/any/texlive-langextra/)
- [texlive-fontsextra](https://archlinux.org/packages/extra/any/texlive-fontsextra/)

</details>

## Arch linux Installation
> You need [`paur`](https://github.com/Morganamilo/paru#installation) to install AUR packages.

To generate the package installing commands run the `install_packages.py` script.


<!-- TODO: Create screenshots section. -->
