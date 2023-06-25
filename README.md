# zer0-x's public dotfiles
> Managed with [Toml Bombadil](https://oknozor.github.io/toml-bombadil/)

Those software and config files represents my Personalized Environment.

## Usage

1. Install `Toml Bombadil`.
2. Clone this repo to `.dotfiles`:
```
git clone https://github.com/zer0-x/dotfiles.git .dotfiles
```
3. Link bombadil:
```
bombadil install .dotfiles
```
4. To use the i3 desktop environment do:
```
bombadil link -p DE_i3
```

<details>
<summary>Dependencies</summary>

### GUI Applications
- [Alacritty](https://alacritty.org/)
- [SQliteBrowser](https://sqlitebrowser.org/)
- [D Spy](https://apps.gnome.org/app/org.gnome.dspy/)
- [ghostwriter](https://ghostwriter.kde.org/)
- [mpv](https://mpv.io/)
    - [mpv-mpris](https://github.com/hoyon/mpv-mpris)
- [feh](https://feh.finalrewind.org/)
- [swayimg](https://github.com/artemsen/swayimg)
- [Easy Effects](https://github.com/wwmm/easyeffects)
- [Qalculate! Qt](https://qalculate.github.io/)
- [zathura](https://pwmt.org/projects/zathura/)
    - [zathura-pdf-mupdf](https://pwmt.org/projects/zathura-pdf-mupdf/)
- [Thunar](https://docs.xfce.org/xfce/thunar/start)
    - [gvfs](https://wiki.gnome.org/Projects/gvfs)
    - [thunar-archive-plugin](https://docs.xfce.org/xfce/thunar/archive)
    - [thunar-media-tags-plugin](https://docs.xfce.org/xfce/thunar/media-tags)
    - [tumbler](https://docs.xfce.org/xfce/tumbler/start)
        - [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
        - [poppler-glib](https://poppler.freedesktop.org/)
        - [libgsf](https://www.digital-scurf.org/software/libgfshare)
- [SlimBookBattery](https://github.com/slimbook/slimbookbattery)
- [System Config Printer](https://github.com/OpenPrinting/system-config-printer)
- [Dialect](https://apps.gnome.org/app/app.drey.Dialect/)


### Desktop Environment

- [rofi](https://github.com/lbonn/rofi)
    - [rofi-calc](https://github.com/svenstaro/rofi-calc)
    - [rofi-emoji](https://github.com/Mange/rofi-emoji)
    - [foxmarks](https://github.com/zer0-x/foxmarks)
- [dunst](https://dunst-project.org/)
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [gnome-keyring](https://wiki.gnome.org/Projects/GnomeKeyring)
- [PolKit Gnome](https://gitlab.gnome.org/Archive/policykit-gnome)
- [greetd](https://git.sr.ht/~kennylevinsen/greetd)
    - [tuigreet](https://github.com/apognu/tuigreet)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)

#### X11

- [i3](https://github.com/i3/i3)
    - [autotiling](https://github.com/nwg-piotr/autotiling)
    - [xorg-setxkbmap](https://archlinux.org/packages/extra/x86_64/xorg-setxkbmap/)
    - [xorg-xset](https://archlinux.org/packages/extra/x86_64/xorg-xset/)
    - [xss-lock](https://bitbucket.org/raymonad/xss-lock)
    - [XSecureLock](https://github.com/google/xsecurelock)
    - [xdotool](https://www.semicomplete.com/projects/xdotool/)
    - [numlockx](https://github.com/rg3/numlockx)
    - [dex](https://github.com/jceb/dex)
- [polybar](https://github.com/polybar/polybar)
    - [lsof](https://github.com/lsof-org/lsof)
    - [cbatticon](https://github.com/valr/cbatticon)
- [picom](https://github.com/yshui/picom)
- [redshift](http://jonls.dk/redshift/)
- [clipmenu](https://github.com/cdown/clipmenu)
- [flameshot](https://github.com/flameshot-org/flameshot)
- [RSIBreak](https://apps.kde.org/rsibreak/)

#### Wayland
- [Hyprland](https://github.com/hyprwm/Hyprland)
    - [xdg-desktop-portal-hyprland](https://github.com/hyprwm/xdg-desktop-portal-hyprland)
    - [xdg-desktop-portal-gtk](https://github.com/flatpak/xdg-desktop-portal-gtk)
    - [Waybar](https://github.com/Alexays/Waybar)
    - [swayidle](https://github.com/swaywm/swayidle)
    - [swaylock](https://github.com/swaywm/swaylock)
- [swappy](https://github.com/jtheoof/swappy)
    - [grim](https://sr.ht/~emersion/grim/)
    - [slurp](https://github.com/emersion/slurp)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter)

You need to enable `greetd`
```
sudo systemctl enable greetd.service
```

You need to config `greetd` by editing `/etc/greetd/config.toml` to be
```
[terminal]
vt = 1

[default_session]
command = "tuigreet --remember --remember-user-session --user-menu --time --cmd Hyprland"
user = "greeter"
```

To integrate gnome-keyring add those lines to `/etc/pam.d/greetd` and `/etc/pam.d/login`
```
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```
and add this line to `/etc/pam.d/passwd`
```
password	optional	pam_gnome_keyring.so
```


### Fonts
- [Noto Fonts](https://fonts.google.com/noto)
- [JetBrainsMono Nerd](https://www.nerdfonts.com/)
- [Nerd Fonts Ubuntu](https://github.com/ryanoasis/nerd-fonts)
- [ttf-dejavu-ib](http://dejavu-fonts.org/wiki/Main_Page)
- [Cantarell](https://cantarell.gnome.org/)

### Themes
#### Icons
- [Papirus Icon Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Adwaita Icon Theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme)
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
- [just](https://github.com/casey/just)
- [python-livereload](https://github.com/lepture/python-livereload)
- [libqalculate](https://qalculate.github.io/)

### CLI Utilities
- [Open Doas](https://github.com/Duncaen/OpenDoas)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [exa](https://the.exa.website/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lfs](https://github.com/Canop/lfs)
- [hexyl](https://github.com/sharkdp/hexyl)
- [handlr](https://github.com/chmln/handlr)
- [trash-cli](https://github.com/andreafrancia/trash-cli)
- [dragon-drop](https://github.com/mwh/dragon)
- [broot](https://github.com/Canop/broot)
- [hyperfine](https://github.com/sharkdp/hyperfine)
- [tokei](https://github.com/XAMPPRocky/tokei)
- [jless](https://github.com/PaulJuliusMartinez/jless)
- [fzf](https://github.com/junegunn/fzf)
- [xclip](https://github.com/astrand/xclip)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [onefetch](https://github.com/o2sh/onefetch)
- [nvtop](https://github.com/Syllo/nvtop)
- [htop](https://htop.dev/)

Since the `br` shell function is custom, after restarting the shell, run that:
```
br --set-install-state refused
```

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
:PackerInstall
```

### Language Servers
- [Python LSP Server](https://github.com/python-lsp/python-lsp-server) <sup>`Python`</sup>
    - [python-lsp-black](https://github.com/python-lsp/python-lsp-black)
- [TexLab](https://github.com/latex-lsp/texlab) <sup>`LaTex`</sup>
- [VSCode CSS LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/css-language-features/server) <sup>`CSS`</sup>
- [VSCode HTML LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/html-language-features/server) <sup>`HTML`</sup>
- [emmet-ls](https://github.com/aca/emmet-ls) <sup>`HTML5/CSS3 snippets`</sup>
- [lua-language-server](https://github.com/sumneko/lua-language-server) <sup>`Lua`</sup>
- [VSCode jSON LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/json-language-features/server) <sup>`JSON`</sup>
- [YAML Language Server](https://github.com/redhat-developer/yaml-language-server) <sup>`YAML`</sup>
- [Eclipse JDT Language Server](https://github.com/eclipse/eclipse.jdt.ls)

### Linters
- [Flawfinder](https://dwheeler.com/flawfinder/) <sup>`C/C++`</sup>
- [mypy](http://www.mypy-lang.org/) <sup>`Python`</sup>
- [flake8](https://flake8.pycqa.org/) <sup>`Python`</sup>
    - [pep8-naming](https://github.com/PyCQA/pep8-naming)
    - [flake8-builtins](https://github.com/gforcada/flake8-builtins)
    - [flake8-comprehensions](https://github.com/adamchainz/flake8-comprehensions)
    - [flake8-bugbear](https://github.com/PyCQA/flake8-bugbear)
- [python-pydocstyle](http://www.pydocstyle.org/) <sup>`Python`</sup>
- [Bandit](https://github.com/PyCQA/bandit) <sup>`Python`</sup>
- [selene-linter](https://github.com/Kampfkarren/selene) <sup>`Lua`</sup>
- [Stylelint](https://stylelint.io/) <sup>`CSS`</sup>
- [Tidy](https://www.html-tidy.org/) <sup>`HTML`</sup>

### Formatters
- [Black](https://github.com/psf/black) <sup>`Python`</sup>
- [StyLua](https://github.com/JohnnyMorganz/StyLua) <sup>`Lua`</sup>
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
- [Clang](https://clang.llvm.org/)

#### Python
- [Python](https://www.python.org/)

#### JavaScript/TypeScript
- [Deno](https://deno.land/)

> **Note** It includes most the tools needed for JS/TS.

#### LaTex
- [texlive](https://archlinux.org/groups/x86_64/texlive/)
- [texlive-langother](https://archlinux.org/packages/extra/any/texlive-langother/)

#### Melody
- [melody](https://github.com/yoav-lavi/melody)

</details>

## Arch linux Installation
> You need [`paur`](https://github.com/Morganamilo/paru#installation) to install AUR packages.

To generate the package installing commands run the `install_packages.py` script.


<!-- TODO: Create screenshots section. -->
