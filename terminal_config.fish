#!/usr/bin/fish

function setup_alacritty
    echo "**** Alacritty ****"
    if test -f $HOME/.config/alacritty/alacritty.yml
        mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.bak;
    end

    git clone https://github.com/catppuccin/alacritty.git $HOME/.config/alacritty/catppuccin;

    switch (uname)
        case Darwin
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-osx.yml $HOME/.config/alacritty/alacritty.yml;
        case Linux
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-linux.yml $HOME/.config/alacritty/alacritty.yml;
        case '*'
            # Do nothing
    end
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

    source $HOME/.config/fish/config.fish;

    # Install fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
    
    # Catppuccin theme
    fisher install catppuccin/fish;
    fish_config theme save "Catppuccin Mocha";
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

function setup_tmux
    echo "**** TMUX ****"
    if test -f $HOME/.tmux.conf
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak;
    end
    mkdir -p $HOME/.tmux/plugins/tpm;
    rm -rf $HOME/.tmux/plugins/tpm;
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.config/tmux;
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/tmux/tmux-linux.conf $HOME/.config/tmux/tmux.conf;
        case Darwin
            ln -s $HOME/.dotfiles/config/tmux/tmux-osx.conf $HOME/.config/tmux/tmux.conf;
    end
    # Install the plugins, inside the tmux press: <preffix>I
    echo "Done."
end

function setup_zellij
    echo "**** ZELLIJ ****"
    mkdir -p $HOME/.config/zellij;
    if test -f $HOME/.config/zellij/config.kdl
        mv $HOME/.config/zellij/config.kdl $HOME/.config/zellij/config.kdl.bak
    end
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/zellij/config-linux.kdl $HOME/.config/zellij/config.kdl
        case Darwin
            ln -s $HOME/.dotfiles/config/zellij/config-osx.kdl $HOME/.config/zellij/config.kdl
        case '*'
            # Do nothing
    end
end

function setup_konsole
    mkdir -p $HOME/tmp;
    git clone git@github.com:catppuccin/konsole.git $HOME/tmp/catppuccin-konsole;
    cp $HOME/tmp/catppuccin-konsole/Catppuccin-Mocha.colorscheme $HOME/.local/share/konsole;
end

function setup_iterm2
    mkdir -p $HOME/.config/iterm2;
    git clone https://github.com/catppuccin/iterm.git;
    # Launch iTerm
    # Press CMD+i (⌘+i)
    # Navigate to the Colors tab
    # Click on Color Presets
    # Click on Import
    # Navigate to the directory where you downloaded the files, and select the files.
    # If you cloned the repo, they are in the colors/ directory.
    # Click on Color Presets and choose the Catppuccin flavour
end

#setup_fish_shell
#setup_alacritty
#setup_starfish_prompt
#setup_tmux
#setup_zellij

