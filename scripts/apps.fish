function install_rust_apps
  echo "**** Rust Apps ****"
  echo "Must install rust toolchain before"
  cargo install du-dust; # du replacement
  cargo install procs; # ps replacement
  cargo install --locked broot; # file manager navigator
  cargo install skim; # fuzzy finder, fzf replacement
  cargo install --locked bacon;
  cargo install --version 0.1.0-alpha.5 gobang;
  cargo install ripgrep; #grep replacement
  cargo install fd-find; #find replacement
  cargo install sd; #sed replacement
  cargo install xh; # httpie replacement
  cargo install bottom --locked; # htop like
  cargo install jql; # a json query
  cargo install gitui; # a git ui for the terminal
  cargo install zoxide; # cd with fuzzy search
  cargo install rm-improved; # rip, rm improved
  cargo install amp; # simple vim like editor
  cargo install fnm; # nvm replacement
  cargo install --locked navi; # to execute cheatsheet, https://github.com/denisidoro/navi#cheatsheet-repositories
  cargo install mcfly; # ctrl r replacement
  cargo install onefetch; # fetch app for code.
  cargo install tokei; # code stats.
  cargo install so; # stackoverflow client.
  cargo install gping; # ping with graphs.
  cargo install tree-sitter-cli; # tree sitter cli.
  cargo install cargo-updater

  # ---------- #
  # other app
  # https://github.com/ogham/dog
  # https://github.com/lakoliu/Furtherance
end

function ubuntu_apps
    # install https://pkgs.org/download/webapp-manager
    sudo apt install -y btop fzf duf ncdu helix starship vlc jq tmux ddgr neofetch htop bat httpie plantuml mpv pgcli;
end

function arch_apps
    sudo pacman -S btop fzf duf ncdu helix starship vlc jq tmux ddgr neofetch htop bat httpie lazygit neovim neovim-qt youtube-dl duf dog ncdu helix fzf plantuml mpv pgcli;
    yay -S jqp-bin;
end

function macos_apps  
    brew install jq duf dog ncdu helix plantuml mpv pgcli;
    brew install noahgorstein/tap/jqp;
end

function other_apps
    # https://github.com/noahgorstein/jqp
end

function app_links
    # Procs configuration
    mkdir -p $HOME/.config/procs;
    ln -s $HOME/.dotfiles/config/procs/config.toml $HOME/.config/procs/config.toml;
    # To use mpv as a image viewer in the terminal
    ln -s $HOME/.dotfiles/config/mvi/ $HOME/.config/mvi;
end
