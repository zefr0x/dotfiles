# zer0-x's public dotfiles
> Managed with [chezmoi](https://www.chezmoi.io/)

Those config files and dependencies represents my Personalized Development Environment.

## Dependencies

### GUI Applications
- [kitty](https://archlinux.org/packages/community/x86_64/kitty/) <sup>`Terminal emulator`</sup>
- [sqlitebrowser](https://archlinux.org/packages/community/x86_64/sqlitebrowser/)
- [ghostwriter](https://archlinux.org/packages/community/x86_64/ghostwriter/) <sup>`For writing in Arabic smoothly`</sup>
- [mpv](https://archlinux.org/packages/community/x86_64/mpv/) <sup>`Media player`</sup>
- [feh](https://archlinux.org/packages/extra/x86_64/feh/) <sup>`Image viewer`</sup>
- [qalculate-qt](https://archlinux.org/packages/extra/x86_64/qalculate-qt/)

### Fonts
- [JetBrainsMono Nerd](https://aur.archlinux.org/packages/nerd-fonts-jetbrains-mono)

### CLI Applications/Tools
- [zsh](https://archlinux.org/packages/extra/x86_64/zsh/) <sup>`Shell`</sup>
- [python-livereload](https://archlinux.org/packages/community/any/python-livereload/)
- [bat](https://archlinux.org/packages/community/x86_64/bat/)
- [libqalculate](https://archlinux.org/packages/extra/x86_64/libqalculate/)

### NeoVim
- [neovim](https://archlinux.org/packages/community/x86_64/neovim/)
- [nvim packer](https://aur.archlinux.org/packages/nvim-packer-git)

After installing packer, you need to install the plugins for neovim by running:
```
:PackerSync
```

#### sup-dependencies <sup>`Required by NeoVim plugins`</sup>
- [ripgrep](https://archlinux.org/packages/community/x86_64/ripgrep/)
- [fd](https://archlinux.org/packages/community/x86_64/fd/)

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

### Programming Languages Tools/Compilers/Interpreters
#### Rust
- [rustup](https://archlinux.org/packages/community/x86_64/rustup/)

After installing it you need to run:
```shell
rustup default stable
```

> **Note** It includes most the tools used for the Rust language.

#### C/C++
- [clang](https://archlinux.org/packages/extra/x86_64/clang/)

#### Python
- [python](https://archlinux.org/packages/core/x86_64/python/)

### LaTex
- [texlive-most](https://archlinux.org/groups/x86_64/texlive-most/)
- [texlive-lang](https://archlinux.org/groups/x86_64/texlive-lang/)
- [texlive-fontsextra](https://archlinux.org/packages/extra/any/texlive-fontsextra/)

## Arch linux Installation
In your shell, run:
```shell
sudo pacman -S --needed ripgrep fd clang rustup jedi-language-server texlab typescript-language-server vscode-css-languageserver vscode-html-languageserver lua-language-server flawfinder mypy flake8 python-pydocstyle selene-linter eslint stylelint tidy texlive-most texlive-lang texlive-fontsextra ghostwriter kitty mpv feh zsh bandit bat qalculate-qt libqalculate rust-analyzer python-black

yay -Sa nvim-packer-git python-flake8-builtins python-flake8-bugbear python-flake8-comprehensions python-pep8-naming nerd-fonts-jetbrains-mono

rustup default stable
```

Then inside neovim, run:
```
:PackerSync
```

## Screen Shots

### Kitty & zsh <sup>[~/.config/kitty](https://github.com/zer0-x/dotfiles/tree/main/dot_config/kitty) | [~/.zshrc](https://github.com/zer0-x/dotfiles/blob/main/dot_zshrc)</sup>
<img width=500px src="" alt="Screenshot for kitty and zsh">

### neovim <sup>[~/.config/nvim/](https://github.com/zer0-x/dotfiles/tree/main/dot_config/nvim)</sup>
<img width=500px src="" alt="Screenshot for neovim">

### [ghostwriter](https://wereturtle.github.io/ghostwriter/) <sup>[~/.config/ghostwriter](https://github.com/zer0-x/dotfiles/tree/main/dot_config/ghostwriter)</sup>
<img width=500px src="https://raw.githubusercontent.com/zer0-x/dotfiles/main/dot_screenshots/ghostwriter.webp" alt="Screenshot for ghostwriter">
