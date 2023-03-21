#!/usr/bin/fish

function setup_basic_install
    echo "**** SOFTWARE ****"
    echo "Installing essentials"

    switch (uname)
        case Linux
            # Ubuntu Essentials
            if [ "Ubuntu" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Ubuntu"
                sudo apt install -y git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses-dev xz-utils tk-dev libffi-dev liblzma-dev python3 openssl xclip;
            end
            # Garuda soft
            if [ "Garuda" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Garuda"
                sudo pacman -S peco openssh git fish exa tmux fd tokei procs ddgr noto-color-emoji-fontconfig noto-fonts-emoji unzip starship jq xclip vlc neofetch keepassxc zsh htop cmake wget llvm httpie bat ripgrep zoxide openssl zlib lzlib readline sqlite ncurses xz tk libffi python-pyopenssl fd skim clang libpqxx gitui nushell zellij;
                sudo pacman -S docker;
                sudo usermod -a -G docker $USER;
                sudo systemctl start docker.service;
                sudo systemctl enable docker.service;
            end
            if [ "Fedora" = (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Fedora"
            end
        case Darwin
            echo "MacOs"
            # install soft for mac
        case '*'
            # Do nothing
    end
    echo "Done."
end

function setup_tmux
    echo "**** TMUX ****"
    if test -f $HOME/.tmux.conf
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak;
    end
    ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf;
    echo "Done."
end

function setup_alacritty
    echo "**** Alacritty ****"
    if test -f $HOME/.config/alacritty/alacritty.yml
        mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.bak;
    end

    switch (uname)
        case Darwin
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-osx.yml $HOME/.config/alacritty/alacritty.yml;
        case Linux
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-linux.yml $HOME/.config/alacritty/alacritty.yml;
        case '*'
            # Do nothing
    end
end

function setup_git
    # SSH
    # ssh-keygen -t ed25519 -b 4096 -C "juanknebel@gmail.com";
    # eval (ssh-agent -c);
    # ssh-add $HOME/.ssh/id_ed25519;
    # xclip -selection clipboard < $HOME/.ssh/id_ed25519.pub;
    # pbcopy < $HOME/.ssh/id_ed25519.pub; #for macos
    echo "**** GIT ****"
    if test -f $HOME/.gitignore_global
        mv $HOME/.gitignore_global $HOME/.gitignore_global.bak;
    end
    ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global;
    git config --global core.excludesfile $HOME/.gitignore_global;
    git config --global init.defaultBranch main;
    git config --global user.email "juanknebel@gmail.com";
    git config --global user.name "Juan Knebel";
    echo "Done."
end

function setup_rust
    echo "**** RUST ****"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
    mkdir -p $HOME/.config/rustfmt;
    if test -f $HOME/.config/rustfmt/rustfmt.toml
        mv $HOME/.config/rustfmt/rustfmt.toml $HOME/rustfmt/rustfmt.toml.bak;
    end
    ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;
    rustup toolchain install nightly;
    rustup default nightly;
    # For webassembly
    rustup target add wasm32-unknown-unknown;
    cargo install trunk;
    echo "Done."
end

function install_rust_apps
    cargo install du-dust;
    cargo install procs;
    cargo install --locked broot;
    cargo install skim;
end

function setup_python
    echo "**** PYTHON ****"
    echo "Pyenv"
    # Pyenv
    rm -rf ~/.pyenv;
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
    pyenv install 3.11;
    pyenv global system;
    pyenv local 3.11;

    echo "Poetry"
    # Poetry
    curl -sSL https://install.python-poetry.org | python3 -;
    poetry completions fish > ~/.config/fish/completions/poetry.fish;
    echo "Done."
end

function setup_java
    echo "**** JAVA ****"
    echo "SDK Manager ..."
    curl -s "https://get.sdkman.io" | bash ;
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
    fisher install reitzig/sdkman-for-fish@v1.4.0;
    echo "Done."
end

function setup_fish_shell
    echo "*** FISH ****"
    echo "Shell"
    # Fish shell
    mkdir -p $HOME/.config/fish/conf.d;
    mkdir -p $HOME/.config/fish/functions;

    echo "Extras"
    # Fish extras
    if test -e "$HOME/.config/fish/config.fish"
        mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.bak;
    end
    ln -s $HOME/.dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish;

    # remove old configs
    rm $HOME/.config/fish/config-*;
    
    # Abbr
    ln -s $HOME/.dotfiles/config/fish/config-alias-abbr.fish $HOME/.config/fish/config-alias-abbr.fish;
    
    # Greeting
    # ln -s $HOME/.dotfiles/config/fish/functions/fish_greeting.fish $HOME/.config/fish/functions/fish_greeting.fish;

    # Coding
    ln -s $HOME/.dotfiles/config/fish/config-dev.fish $HOME/.config/fish/config-dev.fish;

    # Linux
    ln -s $HOME/.dotfiles/config/fish/config-linux.fish $HOME/.config/fish/config-linux.fish;
    
    # Save old garuda config file
    if [ "Garuda" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
        ln -s $HOME/.dotfiles/config/fish/config-garuda.fish $HOME/.config/fish/config-garuda.fish
    end

    # For some local configuration that is only for this machine
    touch $HOME/.config/fish/config-local.fish;

    # echo "Fuzzy search"
    # z fuzzy search if zoxide insn't install
    # mkdir -p $HOME/.local/share/z;
    # touch $HOME/.local/share/z/data;

    # cd $HOME/git;
    # git clone https://github.com/jethrokuan/z.git;
    # ln -s $HOME/git/z/functions/__z_add.fish $HOME/.config/fish/functions/__z_add.fish;
    # ln -s $HOME/git/z/functions/__z_clean.fish $HOME/.config/fish/functions/__z_clean.fish;
    # ln -s $HOME/git/z/functions/__z_complete.fish $HOME/.config/fish/functions/__z_complete.fish;
    # ln -s $HOME/git/z/functions/__z.fish $HOME/.config/fish/functions/__z.fish;
    # ln -s $HOME/git/z/conf.d/z.fish $HOME/.config/fish/conf.d/;

    # Command timer not install if starship is install
    # cd $HOME/git
    # git clone https://github.com/jichu4n/fish-command-timer.git;
    # ln -s $HOME/git/fish-command-timer/conf.d/fish_command_timer.fish $HOME/.config/fish/conf.d;
    source $HOME/.config/fish/config.fish;
    echo "Done."
end

function setup_starfish_prompt
    echo "**** STARSHIP PROMPT ****"
    mkdir -p $HOME/.fonts;
    cd $HOME;
    curl -fLo firaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip;
    unzip firaCode.zip -d $HOME/.fonts;
    rm firaCode.zip;
    echo 'starship init fish | source'>> $HOME/.config/fish/config-local.fish;
    if test -f $HOME/.config/starship.toml
        mv $HOME/.config/starship.toml $HOME/.config/starship.toml.bak
    end
    ln -s $HOME/.dotfiles/config/starship/starship.toml $HOME/.config/starship.toml;
    echo "Done."
end

function init
    echo "**** INIT ****"
    # git clone git@github.com:juanknebel/.dotfiles.git;
    mkdir -p $HOME/git;
    echo "Done."
end

function setup_skim
    echo "**** SKIM ****"
    mkdir -p $HOME/Apps
    ln -s $HOME/.dotfiles/preview.sh $HOME/Apps/preview.sh
end

function setup_zellij
    echo "**** ZELLIJ ****"
    mkdir -p $HOME/.config/zellij;
    if test -f $HOME/.config/zellij/config.kdl
        mv $HOME/.config/zellij/config.kdl $HOME/.config/zellij/config.kdl.bak
    end
    switch (uname)
        case Linux
            ln -s $HOME/.dotfile/config/zellij/config-linux.kdl $HOME/.config/zellij/config.kdl
        case Darwin
            ln -s $HOME/.dotfile/config/zellij/config-osx.kdl $HOME/.config/zellij/config.kdl
        case '*'
            # Do nothing
    end
end


#init
#setup_git
#setup_basic_install
#setup_tmux
#setup_alacritty
#setup_starfish_prompt
#setup_rust
#install_rust_apps
#setup_python
#setup_java
#setup_skim
#setup_fish_shell
#setup_zellij
