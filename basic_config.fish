#!/usr/bin/fish

function init
    echo "**** INIT ****"
    # git clone git@github.com:juanknebel/.dotfiles.git;
    mkdir -p $HOME/git;
    echo "Done."
end

function setup_software
    echo "**** SOFTWARE ****"
    echo "Installing essentials"

    switch (uname)
        case Linux
            # Ubuntu Essentials
            if [ "Ubuntu" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Ubuntu"
                sudo apt install -y git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm lldb libncurses-dev xz-utils tk-dev libffi-dev liblzma-dev python3 openssl xclip;
            end
            # Garuda soft
            if [ "Garuda" =  (lsb_release -a | awk '/^Distributor ID/ {print $3}') ]
                echo "Garuda"
                sudo pacman -S peco openssh git fish exa tmux fd tokei procs ddgr noto-color-emoji-fontconfig noto-fonts-emoji unzip starship jq xclip vlc neofetch keepassxc zsh htop cmake wget llvm httpie bat ripgrep zoxide openssl zlib lzlib readline sqlite ncurses xz tk libffi python-pyopenssl fd skim clang libpqxx gitui nushell zellij youtube-dl lazygit neovim neovim-qt wget curl;
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
            brew install wget curl;
        case '*'
            # Do nothing
    end
    echo "Done."
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


#init
#setup_software
#setup_git

