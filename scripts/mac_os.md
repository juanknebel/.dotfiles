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
brew install fish keepassxc wget neovim firefox megasync python3 jq duf ncdu helix plantuml mpv pgcli yazi ffmpegthumbnailer unar poppler fzf font-symbols-only-nerd-font otree font-meslo-lg-nerd-font zoxide atuin eza fnm lua tmux starship skim dust procs ripgrep sd xh gitui zellij htop bottom amp tokei onefetch rm-improved fd grpcurl glow git-delta powerlevel10k zsh-autosuggestions zsh-syntax-highlighting libreoffice loop spotify protobuf ghostty rio fd;

brew install --cask apidog ghostty;

curl https://mise.run | sh;
curl -LsSf https://astral.sh/uv/install.sh | sh;
```

# zsh
### Ver como migrar estos
```bash
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
```

```bash
mv ~/.zshrc ~.zshrc.bak;
touch ~/.zshrc;
echo "export PATH=/opt/homebrew/bin:\$PATH" >> ~/.zshrc;
echo "# bindkey '^[[A' history-search-backward" >> ~/.zshrc;
echo "# bindkey '^[[B' history-search-forward" >> ~/.zshrc;
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc;
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc;
```

### Atuin
```bash
atuin import auto
echo "# Atuin\neval \"\$(atuin init zsh)\"" >> ~/.zshrc;
```
### Zoxide
```bash
echo "# Zoxide\neval \"\$(zoxide init zsh)\"" >> ~/.zshrc;
```
### Mise
```bash
echo "# Mise\neval \"\$(mise activate zsh)\"" >> ~/.zshrc;
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
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
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
