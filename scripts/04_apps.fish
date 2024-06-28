#!/usr/bin/fish

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
  cargo install --locked zellij;
  cargo install atuin;
  cargo install cargo-updater

  # ---------- #
  # other app
  # https://github.com/ogham/dog
  # https://github.com/lakoliu/Furtherance
end

function install_go_apps
  go install github.com/jesseduffield/lazydocker@latest;
  go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest;
  go install github.com/charmbracelet/glow@latest;
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
            if [ "EndeavourOS" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "EndevourOS"
                arch_apps
            end
        case Darwin
            echo "MacOs"
      	    macos_apps
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
    sudo pacman -S btop fzf duf ncdu helix starship vlc jq tmux ddgr neofetch htop bat httpie lazygit neovim neovim-qt dog plantuml mpv pgcli alacritty wezterm ttf-nerd-fonts-symbols-mono qbittorrent vim falkon yazi ffmpegthumbnailer unarchiver poppler;
    yay -S jqp-bin google-chrome webapp-manager grpcurl-bin;
end

function macos_apps  
    brew install jq duf dog ncdu helix plantuml mpv pgcli yazi ffmpegthumbnailer unar poppler fzf font-symbols-only-nerd-font;
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

function config_skim
    echo "**** SKIM ****"
    mkdir -p $HOME/Apps
    ln -s $HOME/.dotfiles/bin/preview.sh $HOME/Apps/preview.sh
    ln -s $HOME/.dotfiles/bin/sk-tmux $HOME/Apps/sk-tmux;
end

function config_mc
    echo "**** MC ****"
    mkdir -p $HOME/.local/share/mc/skins && cd $HOME/.local/share/mc/skins && git clone https://github.com/catppuccin/mc.git && ln -s -f ./mc/catppuccin.ini .
    # Change or add skin=catppuccin in the [Midnight-Commander] section inside ~/.config/mc/ini
end

install_extra_software
install_rust_apps
install_go_apps
app_links
config_skim
config_mc
