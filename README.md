# zefr0x's public dotfiles

> Managed with [Toml Bombadil](https://oknozor.github.io/toml-bombadil/)

Those software and config files represent my Personalized Desktop Environment.

![ScreenShot](https://github.com/zefr0x/dotfiles/assets/65136727/7f795f3e-fb3c-451f-8966-a6a60fe1ad8a)

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

4. Edit [`vars.toml`](./vars.toml)

5. To use the desktop environment do:

```
bombadil link -p DE_hyprland
```

## Arch linux Installation

> You need [`yay`](https://github.com/Jguer/yay#installation) to install AUR packages.

To generate the package installing commands run the [`install_packages.py`](./install_packages.py) script.

<details>
<summary>Dependencies And Instructions</summary>

### GUI Applications

- [Alacritty](https://alacritty.org/)
- [SQliteBrowser](https://sqlitebrowser.org/)
- [D Spy](https://apps.gnome.org/app/org.gnome.dspy/)
- [mpv](https://mpv.io/)
  - [mpv-mpris](https://github.com/hoyon/mpv-mpris)
- [swayimg](https://github.com/artemsen/swayimg)
- [Easy Effects](https://github.com/wwmm/easyeffects)
- [Helvum](https://gitlab.freedesktop.org/pipewire/helvum)
- [Qalculate!](https://qalculate.github.io/)
- [zathura](https://pwmt.org/projects/zathura/)
  - [zathura-pdf-mupdf](https://pwmt.org/projects/zathura-pdf-mupdf/)
- [PCManFM](https://github.com/lxqt/pcmanfm-qt)
  - [gvfs](https://wiki.gnome.org/Projects/gvfs)
- [System Config Printer](https://github.com/OpenPrinting/system-config-printer)
- [Dialect](https://apps.gnome.org/app/app.drey.Dialect/)
- [Hieroglyphic](https://github.com/FineFindus/Hieroglyphic)

### Desktop Environment

- [rofi](https://github.com/lbonn/rofi)
  - [foxmarks](https://github.com/zefr0x/foxmarks)
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [gnome-keyring](https://wiki.gnome.org/Projects/GnomeKeyring)
  - [Seahorse](https://wiki.gnome.org/Apps/Seahorse)
- [PolKit Gnome](https://gitlab.gnome.org/Archive/policykit-gnome)
- [greetd](https://git.sr.ht/~kennylevinsen/greetd)
  - [tuigreet](https://github.com/apognu/tuigreet)

#### Hyprland (Wayland)

- [Hyprland](https://github.com/hyprwm/Hyprland)
  - [xdg-desktop-portal-hyprland](https://github.com/hyprwm/xdg-desktop-portal-hyprland)
  - [xdg-desktop-portal-gtk](https://github.com/flatpak/xdg-desktop-portal-gtk)
  - [Waybar](https://github.com/Alexays/Waybar)
    - [lsof](https://github.com/lsof-org/lsof)
  - [hyprpicker](https://github.com/hyprwm/hyprpicker)
  - [hypridle](https://github.com/hyprwm/hypridle)
  - [hyprlock](https://github.com/hyprwm/hyprlock)
  - [wl-gammarelay-rs](https://github.com/MaxVerevkin/wl-gammarelay-rs)
- [Satty](https://github.com/gabm/Satty)
  - [grim](https://sr.ht/~emersion/grim/)
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

Edit the `UseIn` value in `/usr/share/xdg-desktop-portal/portals/gtk.portal` and `/usr/share/xdg-desktop-portal/portals/gnome-keyring.portal` to include `Hyprland`:

```
UseIn=gnome;Hyprland
```

<!-- TODO: There should be a pacman hook for this. -->

> [!Note]
> You will need to do this everytime you update those two XDG portals.

Create a `~/Pictures` directiory for screenshots.

### Fonts

- [Noto Fonts](https://fonts.google.com/noto)
- [0xProto Nerd](https://www.nerdfonts.com/)
- [Nerd Fonts Ubuntu](https://www.nerdfonts.com/)
- [ttf-dejavu-ib](http://dejavu-fonts.org/wiki/Main_Page)
- [Cantarell](https://cantarell.gnome.org/)
- [Amiri](https://www.amirifont.org/)

### Themes

#### Icons

- [Papirus Icon Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

#### UI

- [kvantum](https://github.com/tsujan/Kvantum)

Prefer dark theme for GTK-4:

```shell
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

Flatpak allowed files:

- `xdg-config/gtk-4.0:ro`
- `xdg-config/gtk-3.0:ro`
- `xdg-config/kdeglobals:ro`

Flatpak variables:

- `XDG_CURRENT_DESKTOP=KDE`
- `QT_STYLE_OVERRIDE=Breeze`

### CLI/TUI Applications/Tools

- [git](https://git-scm.com/)
  - [delta](https://github.com/dandavison/delta)
- [just](https://github.com/casey/just)
- [pastel](https://github.com/sharkdp/pastel)

### CLI/TUI Utilities

- [Open Doas](https://github.com/Duncaen/OpenDoas)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [eza](https://github.com/eza-community/eza)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [dysk](https://github.com/Canop/dysk)
- [ripdrag](https://github.com/nik012003/ripdrag)
- [broot](https://github.com/Canop/broot)
- [hyperfine](https://github.com/sharkdp/hyperfine)
- [tokei](https://github.com/XAMPPRocky/tokei)
- [less](https://www.greenwoodsoftware.com/less/)
- [jless](https://github.com/PaulJuliusMartinez/jless)
- [skim](https://github.com/lotabout/skim)
- [onefetch](https://github.com/o2sh/onefetch)
- [nvtop](https://github.com/Syllo/nvtop)
- [htop](https://htop.dev/)
- [bandwhich](https://github.com/imsnif/bandwhich)
- [imagemagick](https://imagemagick.org/)

Configure `doas` by editing `/etc/doas.conf`:

```
permit setenv :wheel

```

> [!Note]
> The configuration file must end with a newline.

Now you can uninstall `sudo`:

```
doas pacman -Rnsdd sudo
```

Since the `br` shell function is custom, after restarting the shell, run that:

```
br --set-install-state refused
```

### Shell

- [fish](https://fishshell.com/)
  - [Tide](https://github.com/IlanCosman/tide)
- [dash](https://en.wikipedia.org/wiki/Debian_Almquist_shell)

### Text Editors

- [neovim](https://neovim.io/)
- [GNOME Text Editor](https://apps.gnome.org/TextEditor/)
- [Gtranslator](https://wiki.gnome.org/Apps/Gtranslator)

### Programming Languages Tools/Compilers/Interpreters/etc...

#### Rust

- [rustup](https://github.com/rust-lang/rustup)
  - [cargo-outdated](https://github.com/kbknapp/cargo-outdated)
  - [cargo-bloat](https://github.com/RazrFalcon/cargo-bloat)
  - [cargo-nextest](https://nexte.st/)
  - [cargo-show-asm](https://github.com/pacak/cargo-show-asm)
  - [cargo-depgraph](https://github.com/jplatte/cargo-depgraph)
  - [cargo-supply-chain](https://github.com/rust-secure-code/cargo-supply-chain)
  - [cargo-deny](https://github.com/EmbarkStudios/cargo-deny)
  - [cargo-sort](https://github.com/DevinR528/cargo-sort)
- [mold](https://github.com/rui314/mold)

After installing it you need to run:

```shell
rustup default stable

rustup component add rust-analyzer
```

#### C/C++

- [base-devel](https://archlinux.org/packages/core/any/base-devel/)
- [Clang](https://clang.llvm.org/)
- [Flawfinder](https://dwheeler.com/flawfinder/)

#### Python

- [Python](https://www.python.org/)
- [uv](https://github.com/astral-sh/uv)
- [Python LSP Server](https://github.com/python-lsp/python-lsp-server)
- [Ruff](https://github.com/astral-sh/ruff)
- [mypy](http://www.mypy-lang.org/)

#### Go

- [Go](https://go.dev/)
- [gopls](https://github.com/golang/tools/tree/master/gopls)
- [go-tools](https://github.com/golang/tools)

#### JavaScript/TypeScript

- [Deno](https://deno.land/)

> [!Note]
> It includes most the tools needed for JS/TS.

#### LaTeX

- [texlive](https://archlinux.org/groups/x86_64/texlive/)
- [texlive-langarabic](https://archlinux.org/packages/extra/any/texlive-langarabic/)
- [texlive-langother](https://archlinux.org/packages/extra/any/texlive-langother/)
- [TexLab](https://github.com/latex-lsp/texlab)

#### Lua

- [lua-language-server](https://github.com/LuaLS/lua-language-server)

#### Java

- [OpenJDK](https://openjdk.org/)
- [Gradle](https://gradle.org/)
- [Eclipse JDT Language Server](https://github.com/eclipse/eclipse.jdt.ls)

#### Other

- [VSCode CSS LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/css-language-features/server) <sup>`CSS`</sup>
- [VSCode HTML LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/html-language-features/server) <sup>`HTML`</sup>
- [emmet-ls](https://github.com/aca/emmet-ls) <sup>`HTML5/CSS3 snippets`</sup>
- [VSCode jSON LanguageServer](https://github.com/microsoft/vscode/tree/main/extensions/json-language-features/server) <sup>`JSON`</sup>
- [YAML Language Server](https://github.com/redhat-developer/yaml-language-server) <sup>`YAML`</sup>

</details>
