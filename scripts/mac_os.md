GitConfig
# Git config
# [core]
#   pager = delta
# [interactive]
#   diffFilter = delta --color-only
# [delta]
#   navigate = true    # use n and N to move between diff sections
#   side-by-side = true
#   line-numbers = true
# [merge]
#   conflictstyle = diff3
# [diff]
#   colorMoved = default
#
# SSH
# ssh-keygen -t ed25519 -b 4096 -C "juanknebel@gmail.com";
# eval (ssh-agent -c);
# ssh-add $HOME/.ssh/id_ed25519;
# pbcopy < $HOME/.ssh/id_ed25519.pub; #for macos
ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global;
git config --global core.excludesfile $HOME/.gitignore_global;
git config --global init.defaultBranch main;
git config --global user.email "juanknebel@gmail.com";
git config --global user.name "Juan Knebel";
git config --global core.editor "nvim"

init
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
echo >> /Users/jknebel/.zprofile;
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jknebel/.zprofile;
eval "$(/opt/homebrew/bin/brew shellenv)";

dotfiles
git clone https://github.com/juanknebel/.dotfiles.git;

soft
brew install fish wezterm keepassxc wget neovim firefox megasync python3 jq duf dog ncdu helix plantuml mpv pgcli yazi ffmpegthumbnailer unar poppler fzf font-symbols-only-nerd-font otree font-meslo-lg-nerd-font zoxide atuin eza fnm lua tmux starship skim dust procs ripgrep sd xh gitui zellij bottom amp tokei onefetch rm-improved fd grpcurl glow git-delta powerlevel10k zsh-autosuggestions zsh-syntax-highlighting;

zsh
mv ~/.zshrc ~.zshrc.bak;
touch ~/.zshrc;
echo "export PATH=/opt/homebrew/bin:\$PATH" >> ~/.zshrc;
echo "eval \"\$(atuin init zsh)\"" >> ~/.zshrc;
echo "# bindkey '^[[A' history-search-backward" >> ~/.zshrc;
echo "# bindkey '^[[B' history-search-forward" >> ~/.zshrc;
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc;

Aerospace
brew install --cask nikitabobko/tap/aerospace
mkdir -p .config/aerospace;
nvim .config/aerospace/aerospace.toml;

local/bin
mkdir -p $HOME/Apps;
ln -s $HOME/.dotfiles/bin/sk-tmux $HOME/Apps/sk-tmux;
ln -s $HOME/.dotfiles/bin/preview.sh $HOME/Apps/preview.sh;
mkdir -p $HOME/.config/procs;
ln -s $HOME/.dotfiles/config/procs/config.toml $HOME/.config/procs/config.toml;
ln -s $HOME/.dotfiles/config/mvi/ $HOME/.config/mvi;

python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
git clone https://github.com/alefpereira/pyenv-pyright.git ~/.pyenv/plugins/pyenv-pyright;
~/.pyenv/bin/pyenv install 3.11;
~/.pyenv/bin/pyenv global system;
curl -sSL https://install.python-poetry.org | python3 -;
mkdir -p $HOME/.config/fish/completions/;
~/.local/bin/poetry completions fish > ~/.config/fish/completions/poetry.fish;

fish
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

java
curl -s "https://get.sdkman.io" | bash;
fisher install reitzig/sdkman-for-fish@v1.4.0;
source $HOME/.config/fish/config.fish;
sdk install maven 3.9.9;
sdk install java 17.0.13-zulu;

go
# install from the page https://go.dev/dl/go1.23.2.darwin-arm64.pkg
go install -v golang.org/x/tools/gopls@latest;
go install github.com/go-delve/delve/cmd/dlv@latest;

rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;
rustup toolchain install nightly;
rustup default stable;
rustup component add rust-analyzer;
rustup component add clippy;
rustup component add rustfmt;

javascript
fnm install v20.18.0;
curl -fsSL https://deno.land/install.sh | sh;

Jetbrains
ln -s $HOME/.dotfiles/config/.ideavimrc $HOME/;

Wezterm
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

nvim
pyenv virtualenv-delete pynvim;
pyenv virtualenv 3.11.10 pynvim;
$HOME/.pyenv/versions/3.11.10/envs/pynvim/bin/pip install pynvim;

# Nvim abbr and repos
unlink $HOME/.config/fish/config-abbr-nvim.fish;
unlink $HOME/.config/fish/functions/nv.fish;
ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;

# Nvim default
rm -rf $HOME/.config/nvim;
rm -rf $HOME/.local/share/nvim;
rm -rf $HOME/.local/state/nvim;
ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;

# Nvim for rust
rm -rf $HOME/.config/nvim-rust;
rm -rf $HOME/.local/share/nvim-rust;
rm -rf $HOME/.local/state/nvim-rust;
ln -s $HOME/.dotfiles/config/nvim-rust/ $HOME/.config/nvim-rust;

# Nvim for go
rm -rf $HOME/.config/nvim-go;
rm -rf $HOME/.local/share/nvim-go;
rm -rf $HOME/.local/state/nvim-go;
ln -s $HOME/.dotfiles/config/nvim-go/ $HOME/.config/nvim-go;

# Nvim for python
# rm -rf $HOME/.config/nvim-python;
# rm -rf $HOME/.local/share/nvim-python;
# rm -rf $HOME/.local/state/nvim-python;
# ln -s $HOME/.dotfiles/config/nvim-python/ $HOME/.config/nvim-python;

# Nvim for java
# rm -rf $HOME/.config/nvim-java;
# rm -rf $HOME/.local/share/nvim-java;
# rm -rf $HOME/.local/state/nvim-java;
# ln -s $HOME/.dotfiles/config/nvim-java/ $HOME/.config/nvim-java;

starship script
echo 'starship init fish | source'>> $HOME/.config/fish/config-local.fish;
ln -s $HOME/.dotfiles/config/starship/starship.toml $HOME/.config/starship.toml;


