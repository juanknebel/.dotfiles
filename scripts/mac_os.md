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

# soft
```bash
brew install fish keepassxc wget neovim firefox megasync python3 jq duf ncdu helix plantuml mpv pgcli yazi ffmpegthumbnailer unar poppler fzf font-symbols-only-nerd-font otree font-meslo-lg-nerd-font zoxide atuin eza fnm lua tmux starship skim dust procs ripgrep sd xh gitui zellij htop bottom amp tokei onefetch rm-improved fd grpcurl glow git-delta powerlevel10k zsh-autosuggestions zsh-syntax-highlighting libreoffice loop spotify protobuf ghostty rio fd lazygit tree-sitter tree-sitter-cli gcc;

brew install --cask apidog ghostty;

curl https://mise.run | sh;
curl -LsSf https://astral.sh/uv/install.sh | sh;
```

# zsh
```bash
# Backup existing .zshrc and create new one
mv ~/.zshrc ~/.zshrc.bak 2>/dev/null || true

# Import atuin history
atuin import auto

# Write complete zsh configuration
cat > ~/.zshrc <<'EOF'
# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/zero/.zsh/completions:"* ]]; then export FPATH="/Users/zero/.zsh/completions:$FPATH"; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
. "/Users/zero/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

export PATH="$(brew --prefix openssl@3)/bin:$PATH"

# Useful aliases
alias ls='eza --icons --group-directories-first --color=auto'
alias ll='eza -l --icons --group-directories-first --color=auto'
alias la='eza -a --icons --group-directories-first --color=auto'
alias lla='eza -la --icons --group-directories-first --color=auto'
alias lt='eza -T --icons --group-directories-first --color=auto'

# Function to create a directory and enter it
function mkd() {
    mkdir -p "$1" && cd "$1" || return
}

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7 --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a --height 40% --layout=reverse --border --margin=1 --padding=1'

# Add directories to PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Editor settings
export EDITOR='nvim'
export VISUAL='nvim'

# Language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Powerlevel10k theme
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Atuin
eval "$(atuin init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Mise
eval "$(mise activate zsh)"
EOF
```

# Ghostty
```bash
# This is the configuration file for Ghostty.
#
# This template file has been automatically created at the following
# path since Ghostty couldn't find any existing config files on your system:
#
#   /home/zero/.config/ghostty/config
#
# The template does not set any default options, since Ghostty ships
# with sensible defaults for all options. Users should only need to set
# options that they want to change from the default.
#
# Run `ghostty +show-config --default --docs` to view a list of
# all available config options and their default values.
#
# Additionally, each config option is also explained in detail
# on Ghostty's website, at https://ghostty.org/docs/config.

# Config syntax crash course
# ==========================
# # The config file consists of simple key-value pairs,
# # separated by equals signs.
# font-family = Iosevka
# window-padding-x = 2
#
# # Spacing around the equals sign does not matter.
# # All of these are identical:
# key=value
# key= value
# key =value
# key = value
#
# # Any line beginning with a # is a comment. It's not possible to put
# # a comment after a config option, since it would be interpreted as a
# # part of the value. For example, this will have a value of "#123abc":
# background = #123abc
#
# # Empty values are used to reset config keys to default.
# key =
#
# # Some config options have unique syntaxes for their value,
# # which is explained in the docs for that config option.
# # Just for example:
# resize-overlay-duration = 4s 200ms
command = /bin/zsh
shell-integration = zsh
clipboard-read = allow
clipboard-write = allow
copy-on-select = true
background = #191724
foreground = #e0def4
selection-background = #403d52
selection-foreground = #e0def4
cursor-color = #e0def4
cursor-text = #191724
palette = 0=#26233a
palette = 1=#eb6f92
palette = 2=#31748f
palette = 3=#f6c177
palette = 4=#9ccfd8
palette = 5=#c4a7e7
palette = 6=#ebbcba
palette = 7=#e0def4
palette = 8=#6e6a86
palette = 9=#eb6f92
palette = 10=#31748f
palette = 11=#f6c177
palette = 12=#9ccfd8
palette = 13=#c4a7e7
palette = 14=#ebbcba
palette = 15=#e0def4
palette = 16=#c9826b
keybind = shift+enter=text:\n
keybind = ctrl+shift+r=new_split:right
keybind = ctrl+shift+d=new_split:down
maximize = true
confirm-close-surface = false
font-family = MesloLGS Nerd Font Mono
```
# Aerospace
```bash
brew install --cask nikitabobko/tap/aerospace
mkdir -p .config/aerospace;
nvim .config/aerospace/aerospace.toml;
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

# Jetbrains
```bash
ln -s $HOME/.dotfiles/config/.ideavimrc $HOME/;
```

# nvim
```bash
rm -rf ~/.config/nvim;
rm -rf ~/.local/share/nvim;
rm -rf ~/.local/state/nvim;
rm -rf ~/.cache/nvim;
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
mkdir -p ~/.config/nvim/lua/plugins

cat >~/.config/nvim/lua/plugins/snacks.lua <<'EOF'
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- for hidden files
        ignored = true, -- for .gitignore files
      },
    },
  },
}
EOF

cat >~/.config/nvim/lua/plugins/fzf-lua.lua <<'EOF'
return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        fd_opts = "--type f --hidden --no-ignore --no-ignore --exclude .git --exclude node_modules",
      },
      grep = {
        rg_opts = "--hidden --no-ignore --column --line-number --no-heading --color=always --smart-case",
      },
    },
  },
}
EOF

# 1. Open Neovim
# 2. Run :LazyExtras
# 3. Search and enable 'editor.fzf'
mkdir -p ~/.config/nvim/lua/config
echo 'vim.o.shell = "/bin/zsh"' >>~/.config/nvim/lua/config/options.lua

cat >~/.config/nvim/lua/plugins/claude-code.lua <<'EOF'
return {
  "nandoolle/claude-code.nvim",
  cmd = "ClaudeCode", -- Load when :ClaudeCode is executed
  keys = {
    { "<leader>ai", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
  },
  config = function()
    require("claude-code").setup({
      keybinding = "<leader>ai", -- Custom keybinding
    })
  end,
}
EOF

# python-pylatexenc

cat >~/.config/nvim/lua/plugins/render-markdown.lua <<'EOF'
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the m
ini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
EOF
```

```npm
mkdir -p "${HOME}/.npm-global"
npm config set prefix "${HOME}/.npm-global"
```
