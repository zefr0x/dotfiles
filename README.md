# zer0-x's public dotfiles
> Managed with [chezmoi](https://www.chezmoi.io/)

Those config files represents my Personalized Environment.

<details>
<summary>Dependencies</summary>

### GUI Applications
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [sqlitebrowser](https://sqlitebrowser.org/)
- [D Spy](https://apps.gnome.org/app/org.gnome.dspy/)
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
    - [XSecureLock](https://github.com/google/xsecurelock)
    - [xdotool](https://www.semicomplete.com/projects/xdotool/)
    - [numlockx](https://github.com/rg3/numlockx)
    - [dex](https://github.com/jceb/dex)
- [polybar](https://github.com/polybar/polybar)
    - [pamixer](https://github.com/cdemoulins/pamixer)
    - [lsof](https://github.com/lsof-org/lsof)
    - [cbatticon](https://github.com/valr/cbatticon)
    - [brightnessctl](https://github.com/Hummer12007/brightnessctl)
- [picom](https://github.com/yshui/picom)
- [redshift](http://jonls.dk/redshift/)
- [rofi](https://github.com/DaveDavenport/rofi)
    - [rofi-calc](https://github.com/svenstaro/rofi-calc)
    - [rofi-emoji](https://github.com/Mange/rofi-emoji)
    - [foxmarks](https://github.com/zer0-x/foxmarks)
- [dunst](https://dunst-project.org/)
- [clipmenu](https://github.com/cdown/clipmenu)
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [kwallet](https://archlinux.org/packages/extra/x86_64/kwallet/)
    - [kwallet-pam](https://archlinux.org/packages/extra/x86_64/kwallet-pam/)
- [lxsession-gtk3](https://www.lxde.org/)
- [flameshot](https://github.com/flameshot-org/flameshot)
- [greetd](https://git.sr.ht/~kennylevinsen/greetd)
    - [tuigreet](https://github.com/apognu/tuigreet)
- [rsibreak](https://apps.kde.org/rsibreak/)

You need to enable `greetd`
```
sudo systemctl enable greetd.service
```

You need to config `greetd` by editing `/etc/greetd/config.toml` to be
```
[terminal]
vt = 1

[default_session]
command = "tuigreet --remember --remember-user-session --user-menu --time --cmd startx"
user = "greeter"
```

To integrate kwallet add those lines to `/etc/pam.d/greetd`
```
auth       optional     pam_kwallet5.so
session    optional     pam_kwallet5.so auto_start force_run
```


### Fonts
- [Noto Fonts](https://fonts.google.com/noto)
- [JetBrainsMono Nerd](https://www.nerdfonts.com/)
- [nerd-fonts-ubuntu](https://github.com/ryanoasis/nerd-fonts)
- [ttf-dejavu-ib](http://dejavu-fonts.org/wiki/Main_Page)

### Themes
#### Icons
- [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [adwaita-icon-theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme)
#### UI
- [qt5ct](https://sourceforge.net/projects/qt5ct/)
- [qt6ct](https://github.com/trialuser02/qt6ct)
- [kvantum](https://github.com/tsujan/Kvantum)
- [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/)

Set the Qt5 theme by adding this line: `QT_QPA_PLATFORMTHEME=qt5ct` to your `/etc/environment` file.

Prefer dark theme for GTK-4:
```shell
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

### CLI/TUI Applications/Tools
- [git](https://git-scm.com/)
    - [delta](https://github.com/dandavison/delta)
- [python-livereload](https://github.com/lepture/python-livereload)
- [libqalculate](https://qalculate.github.io/)
- [xclip](https://github.com/astrand/xclip)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [trash-cli](https://github.com/andreafrancia/trash-cli)
- [pulsemixer](https://github.com/GeorgeFilipkin/pulsemixer)
- [onefetch](https://github.com/o2sh/onefetch)
- [tokei](https://github.com/XAMPPRocky/tokei)
- [nvtop](https://github.com/Syllo/nvtop)
- [htop](https://htop.dev/)
- [nnn](https://github.com/jarun/nnn)
- [dragon-drop](https://github.com/mwh/dragon)
- [just](https://github.com/casey/just)
- [hyperfine](https://github.com/sharkdp/hyperfine)
- [jless](https://github.com/PaulJuliusMartinez/jless)

### CLI Utilities
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [exa](https://the.exa.website/)
- [hexyl](https://github.com/sharkdp/hexyl)
- [fzf](https://github.com/junegunn/fzf)
- [handlr](https://github.com/chmln/handlr)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Open Doas](https://github.com/Duncaen/OpenDoas)

### Shell
- [fish](https://fishshell.com/)
    - [Tide](https://github.com/IlanCosman/tide)
    - [fzf.fish](https://github.com/PatrickF1/fzf.fish)
    - [bass](https://github.com/edc/bass)
    - [virtualfish](https://github.com/justinmayer/virtualfish)
- [dash](https://en.wikipedia.org/wiki/Debian_Almquist_shell)


### NeoVim <sup>`Text Editor`</sup>
- [neovim](https://neovim.io/)
    - [packer](https://github.com/wbthomason/packer.nvim)

After installing, you need to install the plugins for neovim by running:
```
:Lazy install
:Lazy restore
```

### Language Servers
- [python-lsp-server](https://github.com/python-lsp/python-lsp-server) <sup>`Python`</sup>
    - [python-lsp-black](https://github.com/python-lsp/python-lsp-black)
- [texlab](https://github.com/latex-lsp/texlab) <sup>`LaTex`</sup>
- [vscode-css-languageserver](https://github.com/microsoft/vscode/tree/main/extensions/css-language-features/server) <sup>`CSS`</sup>
- [vscode-html-languageserver](https://github.com/microsoft/vscode/tree/main/extensions/html-language-features/server) <sup>`HTML`</sup>
- [emmet-ls](https://github.com/aca/emmet-ls) <sup>`HTML5/CSS3 snippets`</sup>
- [lua-language-server](https://github.com/sumneko/lua-language-server) <sup>`Lua`</sup>
- [vscode-json-languageserver](https://github.com/microsoft/vscode/tree/main/extensions/json-language-features/server) <sup>`JSON`</sup>
- [yaml-language-server](https://github.com/redhat-developer/yaml-language-server) <sup>`YAML`</sup>
- [jdtls](https://github.com/eclipse/eclipse.jdt.ls)

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
- [stylelint](https://stylelint.io/) <sup>`CSS`</sup>
- [tidy](https://www.html-tidy.org/) <sup>`HTML`</sup>

### Formatters
- [black](https://github.com/psf/black) <sup>`Python`</sup>
- [stylua](https://github.com/JohnnyMorganz/StyLua) <sup>`Lua`</sup>
- [shfmt](https://github.com/mvdan/sh) <sup>`shell`</sup>

### Programming Languages Tools/Compilers/Interpreters
#### Rust
- [rustup](https://github.com/rust-lang/rustup.rs)
- [mold](https://github.com/rui314/mold)

After installing it you need to run:
```shell
rustup default stable

rustup component add rust-analyzer
```

> **Note** It includes most the tools used for the Rust language.

#### C/C++
- [base-devel](https://archlinux.org/groups/x86_64/base-devel/)
- [clang](https://clang.llvm.org/)

#### Python
- [python](https://www.python.org/)

#### JavaScript/TypeScript
- [Deno](https://deno.land/)

> **Note** It includes most the tools needed for JS/TS.

#### LaTex
- [texlive-most](https://archlinux.org/groups/x86_64/texlive-most/)
- [texlive-langextra](https://archlinux.org/packages/extra/any/texlive-langextra/)
- [texlive-fontsextra](https://archlinux.org/packages/extra/any/texlive-fontsextra/)

#### Melody
- [melody](https://github.com/yoav-lavi/melody)

</details>

## Arch linux Installation
> You need [`paur`](https://github.com/Morganamilo/paru#installation) to install AUR packages.

To generate the package installing commands run the `install_packages.py` script.


<!-- TODO: Create screenshots section. -->
