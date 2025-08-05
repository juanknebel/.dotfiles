#!/usr/bin/fish

function install_rust_apps
  echo "**** Rust Apps ****"
  echo "Must install rust toolchain before"
  cargo install cargo-updater
  cargo install --locked bacon;
  # cargo install du-dust; # du replacement
  # cargo install procs; # ps replacement
  # cargo install skim; # fuzzy finder, fzf replacement
  # cargo install ripgrep; #grep replacement
  #cargo install fd-find; #find replacement
  # cargo install sd; #sed replacement
  # cargo install xh; # httpie replacement
  # cargo install bottom --locked; # htop like
  # cargo install gitui; # a git ui for the terminal
  # cargo install zoxide; # cd with fuzzy search
  #cargo install rm-improved; # rip, rm improved
  # cargo install amp; # simple vim like editor
  # cargo install fnm; # nvm replacement
  # cargo install onefetch; # fetch app for code.
  # cargo install tokei; # code stats.
  # cargo install --locked zellij;
  # cargo install atuin;
  # cargo install --git https://github.com/fioncat/otree;

  # ---------- #
  # other app
  # https://github.com/ogham/dog
  # https://github.com/lakoliu/Furtherance
end

function install_go_apps
  go install github.com/jesseduffield/lazydocker@latest;
  #go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest;
  #go install github.com/charmbracelet/glow@latest;
  go install github.com/jorgerojas26/lazysql@latest;
end

function install_python_apps
  pipx install frogmouth;
  pipx install harlequin;
  pipx install calcure;
  pipx install posting;
end

function install_extra_software
    # Cli apps
    # https://github.com/wustho/epr -> epub reader
    # https://github.com/larose/utt -> time tracker
    # https://github.com/nikolassv/bartib -> time tracker
    switch (uname)
        case Linux
            # Ubuntu Essentials
            if [ "Ubuntu" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Ubuntu"
		            ubuntu_apps
            end
        case '*'
            # Do nothing
    end
    echo "Done."
end

function ubuntu_apps
    # install https://pkgs.org/download/webapp-manager
    sudo apt install -y btop fzf duf ncdu helix starship vlc jq tmux ddgr neofetch htop bat httpie plantuml mpv pgcli;
end

function arch_apps
    sudo pacman -S btop fzf duf ncdu helix starship vlc jq tmux ddgr neofetch htop bat httpie lazygit neovim neovim-qt dog plantuml mpv pgcli alacritty wezterm ttf-nerd-fonts-symbols-mono qbittorrent vim falkon yazi ffmpegthumbnailer unarchiver poppler tabiew serpl zenith atac ttf-meslo-nerd ghostty jless slumber ncspot gdu bottom tree-sitter-cli wl-clipboard;
    yay -S jqp-bin google-chrome webapp-manager grpcurl-bin otree;
end

function app_links
    # Procs configuration
    mkdir -p $HOME/.config/procs;
    ln -s $HOME/.dotfiles/config/procs/config.toml $HOME/.config/procs/config.toml;
    # To use mpv as a image viewer in the terminal
    ln -s $HOME/.dotfiles/config/mvi/ $HOME/.config/mvi;
end

function config_skim
    echo "**** SKIM ****"
    mkdir -p $HOME/Apps
    ln -s $HOME/.dotfiles/bin/preview.sh $HOME/Apps/preview.sh
    ln -s $HOME/.dotfiles/bin/sk-tmux $HOME/Apps/sk-tmux;
end

install_extra_software
install_rust_apps
install_go_apps
app_links
config_skim
