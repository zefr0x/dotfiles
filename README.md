# zefr0x's public dotfiles

> Managed with [Toml Bombadil](https://oknozor.github.io/toml-bombadil/)

Those software and config files represents my Personalized Environment.

## Usage

1. Install `Toml Bombadil`.
2. Clone this repo to `.dotfiles`:

```
git clone https://github.com/zefr0x/dotfiles.git .dotfiles
```

3. Link bombadil:

```
bombadil install .dotfiles
```

4. To use the desktop environment do:

```
bombadil link -p DE_hyprland
```

<details>
<summary>Dependencies</summary>

### GUI Applications

- [Alacritty](https://alacritty.org/)
- [SQliteBrowser](https://sqlitebrowser.org/)
- [D Spy](https://apps.gnome.org/app/org.gnome.dspy/)
- [mpv](https://mpv.io/)
  - [mpv-mpris](https://github.com/hoyon/mpv-mpris)
- [swayimg](https://github.com/artemsen/swayimg)
- [Easy Effects](https://github.com/wwmm/easyeffects)
- [Helvum](https://gitlab.freedesktop.org/pipewire/helvum)
- [Qalculate! Qt](https://qalculate.github.io/)
- [zathura](https://pwmt.org/projects/zathura/)
  - [zathura-pdf-mupdf](https://pwmt.org/projects/zathura-pdf-mupdf/)
- [PCManFM](https://github.com/lxqt/pcmanfm-qt)
  - [gvfs](https://wiki.gnome.org/Projects/gvfs)
  - [tumbler](https://docs.xfce.org/xfce/tumbler/start)
    - [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
    - [poppler-glib](https://poppler.freedesktop.org/)
    - [libgsf](https://www.digital-scurf.org/software/libgfshare)
- [SlimBookBattery](https://github.com/slimbook/slimbookbattery)
- [System Config Printer](https://github.com/OpenPrinting/system-config-printer)
- [Dialect](https://apps.gnome.org/app/app.drey.Dialect/)

### Desktop Environment

- [rofi](https://github.com/lbonn/rofi)
  - [rofi-emoji](https://github.com/Mange/rofi-emoji)
  - [foxmarks](https://github.com/zefr0x/foxmarks)
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [gnome-keyring](https://wiki.gnome.org/Projects/GnomeKeyring)
- [PolKit Gnome](https://gitlab.gnome.org/Archive/policykit-gnome)
- [greetd](https://git.sr.ht/~kennylevinsen/greetd)
  - [tuigreet](https://github.com/apognu/tuigreet)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
- [dex](https://github.com/jceb/dex)

#### Hyprland (Wayland)

- [Hyprland](https://github.com/hyprwm/Hyprland)
  - [xdg-desktop-portal-hyprland](https://github.com/hyprwm/xdg-desktop-portal-hyprland)
  - [xdg-desktop-portal-gtk](https://github.com/flatpak/xdg-desktop-portal-gtk)
  - [Waybar](https://github.com/Alexays/Waybar)
    - [lsof](https://github.com/lsof-org/lsof)
    - [jq](https://github.com/jqlang/jq)
  - [Hyprland Per Window Layout](https://github.com/coffebar/hyprland-per-window-layout)
  - [swayidle](https://github.com/swaywm/swayidle)
  - [swaylock](https://github.com/swaywm/swaylock)
  - [Gammastep](https://gitlab.com/chinstrap/gammastep)
- [swappy](https://github.com/jtheoof/swappy)
  - [wayshot](https://github.com/waycrate/wayshot)
  - [slurp](https://github.com/emersion/slurp)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter)
  - [ianny](https://github.com/zefr0x/ianny)

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
- [Amiri](https://github.com/aliftype/amiri)

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
- [pastel](https://github.com/sharkdp/pastel)

### CLI Utilities

- [Open Doas](https://github.com/Duncaen/OpenDoas)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [eza](https://github.com/eza-community/eza)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [dysk](https://github.com/Canop/dysk)
- [hexyl](https://github.com/sharkdp/hexyl)
- [handlr](https://github.com/chmln/handlr)
- [trash-cli](https://github.com/andreafrancia/trash-cli)
- [ripdrag](https://github.com/nik012003/ripdrag)
- [broot](https://github.com/Canop/broot)
- [hyperfine](https://github.com/sharkdp/hyperfine)
- [tokei](https://github.com/XAMPPRocky/tokei)
- [less](https://www.greenwoodsoftware.com/less/)
- [jless](https://github.com/PaulJuliusMartinez/jless)
- [skim](https://github.com/lotabout/skim)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [onefetch](https://github.com/o2sh/onefetch)
- [nvtop](https://github.com/Syllo/nvtop)
- [htop](https://htop.dev/)
- [imagemagick](https://imagemagick.org/)

Since the `br` shell function is custom, after restarting the shell, run that:

```
br --set-install-state refused
```

### Shell

- [fish](https://fishshell.com/)
  - [Tide](https://github.com/IlanCosman/tide)
  - [bass](https://github.com/edc/bass)
  - [virtualfish](https://github.com/justinmayer/virtualfish)
- [dash](https://en.wikipedia.org/wiki/Debian_Almquist_shell)

### Text Editors

- [neovim](https://neovim.io/)
- [GNOME Text Editor](https://apps.gnome.org/TextEditor/)

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

### Linkers

- [mold](https://github.com/rui314/mold)

### Programming Languages Tools/Compilers/Interpreters

#### Rust

- [rustup](https://github.com/rust-lang/rustup.rs)
  - [cargo-outdated](https://github.com/kbknapp/cargo-outdated)
  - [cargo-bloat](https://github.com/RazrFalcon/cargo-bloat)
  - [cargo-nextest](https://nexte.st/)
  - [cargo-asm](https://github.com/gnzlbg/cargo-asm)
  - [cargo-depgraph](https://github.com/jplatte/cargo-depgraph)
  - [cargo-supply-chain](https://github.com/rust-secure-code/cargo-supply-chain)
  - [cargo-deny](https://github.com/EmbarkStudios/cargo-deny)
  - [cargo-sort](https://github.com/DevinR528/cargo-sort)

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
- [texlive-langarabic](https://archlinux.org/packages/extra/any/texlive-langarabic/)
- [texlive-langother](https://archlinux.org/packages/extra/any/texlive-langother/)

#### Melody

- [melody](https://github.com/yoav-lavi/melody)

### Java

- [OpenJDK](https://openjdk.org/)
- [OpenJDK-17](https://openjdk.org/)
- [Gradle](https://gradle.org/)

</details>

## Arch linux Installation

> You need [`yay`](https://github.com/Jguer/yay#installation) to install AUR packages.

To generate the package installing commands run the `install_packages.py` script.

<!-- TODO: Create screenshots section. -->
