# SSH
```bash
ssh-keygen -t ed25519 -b 4096 -C "juanknebel@gmail.com";
eval (ssh-agent -c);
ssh-add $HOME/.ssh/id_ed25519;
pbcopy < $HOME/.ssh/id_ed25519.pub; #for macos
```

# GIT
```bash
ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global;
git config --global core.excludesfile $HOME/.gitignore_global;
git config --global init.defaultBranch main;
git config --global user.email "juanknebel@gmail.com";
git config --global user.name "Juan Knebel";
git config --global core.editor "nvim"
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.line-numbers true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
```

# init
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
echo >> /Users/jknebel/.zprofile;
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jknebel/.zprofile;
eval "$(/opt/homebrew/bin/brew shellenv)";
```

# dotfiles
```bash
git clone https://github.com/juanknebel/.dotfiles.git;
```

# soft
```bash
brew install fish keepassxc wget neovim firefox megasync python3 jq duf ncdu helix plantuml mpv pgcli yazi ffmpegthumbnailer unar poppler fzf font-symbols-only-nerd-font otree font-meslo-lg-nerd-font zoxide atuin eza fnm lua tmux starship skim dust procs ripgrep sd xh gitui zellij htop bottom amp tokei onefetch rm-improved fd grpcurl glow git-delta powerlevel10k zsh-autosuggestions zsh-syntax-highlighting libreoffice loop spotify protobuf ghostty rio fd;

brew install --cask apidog ghostty;

curl https://mise.run | sh;
curl -LsSf https://astral.sh/uv/install.sh | sh;
```

# zsh
```bash
mv ~/.zshrc ~.zshrc.bak;
touch ~/.zshrc;
echo "export PATH=/opt/homebrew/bin:\$PATH" >> ~/.zshrc;
echo "eval \"\$(atuin init zsh)\"" >> ~/.zshrc;
echo "# bindkey '^[[A' history-search-backward" >> ~/.zshrc;
echo "# bindkey '^[[B' history-search-forward" >> ~/.zshrc;
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc;
```

# Aerospace
```bash
brew install --cask nikitabobko/tap/aerospace
mkdir -p .config/aerospace;
nvim .config/aerospace/aerospace.toml;
```

# local/bin
```bash
mkdir -p $HOME/Apps;
ln -s $HOME/.dotfiles/bin/sk-tmux $HOME/Apps/sk-tmux;
ln -s $HOME/.dotfiles/bin/preview.sh $HOME/Apps/preview.sh;
mkdir -p $HOME/.config/procs;
ln -s $HOME/.dotfiles/config/procs/config.toml $HOME/.config/procs/config.toml;
ln -s $HOME/.dotfiles/config/mvi/ $HOME/.config/mvi;
```

# python
```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
git clone https://github.com/alefpereira/pyenv-pyright.git ~/.pyenv/plugins/pyenv-pyright;
~/.pyenv/bin/pyenv install 3.11;
~/.pyenv/bin/pyenv global system;
curl -sSL https://install.python-poetry.org | python3 -;
mkdir -p $HOME/.config/fish/completions/;
~/.local/bin/poetry completions fish > ~/.config/fish/completions/poetry.fish;
```

# fish
```bash
ln -s $HOME/.dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish;
ln -s $HOME/.dotfiles/config/fish/config-alias-abbr.fish $HOME/.config/fish/config-alias-abbr.fish;
ln -s $HOME/.dotfiles/config/fish/config-dev.fish $HOME/.config/fish/config-dev.fish;
touch $HOME/.config/fish/config-local.fish;
Mkdir -p $HOME/.config/fish/conf.d/;
ln -s $HOME/.dotfiles/config/fish/conf.d/fnm.fish $HOME/.config/fish/conf.d/fnm.fish;
ln -s $HOME/.dotfiles/config/fish/config-osx.fish $HOME/.config/fish/config-osx.fish;
source $HOME/.config/fish/config.fish;
fish;
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
```

# java
```bash
curl -s "https://get.sdkman.io" | bash;
fisher install reitzig/sdkman-for-fish@v1.4.0;
source $HOME/.config/fish/config.fish;
sdk install maven 3.9.9;
sdk install java 17.0.13-zulu;
```

# go
```bash
# install from the page https://go.dev/dl/go1.23.2.darwin-arm64.pkg
go install -v golang.org/x/tools/gopls@latest;
go install github.com/go-delve/delve/cmd/dlv@latest;
```

# rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;
rustup toolchain install nightly;
rustup default stable;
rustup component add rust-analyzer;
rustup component add clippy;
rustup component add rustfmt;
```

# javascript
```bash
fnm install v20.18.0;
curl -fsSL https://deno.land/install.sh | sh;
```

# Jetbrains
```bash
ln -s $HOME/.dotfiles/config/.ideavimrc $HOME/;
```

# Wezterm
```bash
mkdir -p $HOME/.config/wezterm/;
ln -s $HOME/.dotfiles/config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua;
ln -s $HOME/.dotfiles/config/wezterm/font.lua $HOME/.config/wezterm/font.lua;
ln -s $HOME/.dotfiles/config/wezterm/cursor.lua $HOME/.config/wezterm/cursor.lua;
ln -s $HOME/.dotfiles/config/wezterm/mouse_binds.lua $HOME/.config/wezterm/mouse_binds.lua;
ln -s $HOME/.dotfiles/config/wezterm/utils.lua $HOME/.config/wezterm/utils.lua;
ln -s $HOME/.dotfiles/config/wezterm/ui.lua $HOME/.config/wezterm/ui.lua;
ln -s $HOME/.dotfiles/config/wezterm/keybinds-osx.lua $HOME/.config/wezterm/keybinds.lua;
ln -s $HOME/.dotfiles/config/wezterm/shell-osx.lua $HOME/.config/wezterm/shell.lua;
ln -s $HOME/.dotfiles/config/wezterm/startup-osx.lua $HOME/.config/wezterm/startup.lua;
```

# nvim
```bash
pyenv virtualenv-delete pynvim;
pyenv virtualenv 3.11.10 pynvim;
$HOME/.pyenv/versions/3.11.10/envs/pynvim/bin/pip install pynvim;
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

# starship script
```bash
echo 'starship init fish | source'>> $HOME/.config/fish/config-local.fish;
ln -s $HOME/.dotfiles/config/starship/starship.toml $HOME/.config/starship.toml;
```

# zellij
```bash
mkdir -p $HOME/.config/zellij/plugins;
ln -s $HOME/.dotfiles/config/zellij/config-osx.kdl $HOME/.config/zellij/config.kdl;
ln -s $HOME/.dotfiles/config/zellij/layouts $HOME/.config/zellij/layouts;
curl -LO https://github.com/imsnif/weather-pal/releases/latest/download/weather-pal.wasm -o $HOME/.config/zellij/plugins/;
curl -LO https://github.com/imsnif/monocle/releases/latest/download/monocle.wasm -o $HOME/.config/zellij/plugins/;
curl -LO https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm -o $HOME/.config/zellij/plugins/;
```
