#!/usr/bin/fish

function setup_fish_shell
    echo "*** FISH ****"
    echo "Shell"
    # Fish shell
    mkdir -p $HOME/.config/fish/conf.d;
    mkdir -p $HOME/.config/fish/functions;

    # Fish configuration
    if test -e "$HOME/.config/fish/config.fish"
        mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.bak;
    end
    ln -s $HOME/.dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish;

    # remove old configs
    rm $HOME/.config/fish/config-*;
    
    # Abbr
    ln -s $HOME/.dotfiles/config/fish/config-alias-abbr.fish $HOME/.config/fish/config-alias-abbr.fish;

    # Nvim abbr and repos
    ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
    git clone git@github.com:pgosar/CyberNvim.git ~/.config/CyberNvim:
    git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim;
    git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/KickstarNvim;
    ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;
    
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

    # cond.d
    ln -s $HOME/.dotfiles/config/fish/conf.d/fnm.fish $HOME/.config/fish/conf.d/fnm.fish;

    source $HOME/.config/fish/config.fish;

    # Install fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
    
    # Catppuccin theme
    fisher install catppuccin/fish;
    fish_config theme save "Catppuccin Mocha";
    echo "Done."
end

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
    ln -s $HOME/.dotfiles/config/alacritty/themes/ $HOME/.config/alacritty/themes;
end

function setup_wezterm
    echo "**** Wezterm ****"
    if test -f $HOME/.config/wezterm/wezterm.lua
        mv $HOME/.config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua.bak;
    end

    mkdir -p $HOME/.config/wezterm/;

    switch (uname)
        case Darwin
            ln -s $HOME/.dotfiles/config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua;
            ln -s $HOME/.dotfiles/config/wezterm/font.lua $HOME/.config/wezterm/font.lua;
            ln -s $HOME/.dotfiles/config/wezterm/cursor.lua $HOME/.config/wezterm/cursor.lua;
            ln -s $HOME/.dotfiles/config/wezterm/keybinds-osx.lua $HOME/.config/wezterm/keybinds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/mouse_binds.lua $HOME/.config/wezterm/mouse_binds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/shell-osx.lua $HOME/.config/wezterm/shell.lua;
            ln -s $HOME/.dotfiles/config/wezterm/utils.lua $HOME/.config/wezterm/utils.lua;
            ln -s $HOME/.dotfiles/config/wezterm/ui.lua $HOME/.config/wezterm/ui.lua;
            ln -s $HOME/.dotfiles/config/wezterm/startup-osx.lua $HOME/.config/wezterm/startup.lua;
        case Linux
            ln -s $HOME/.dotfiles/config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua;
            ln -s $HOME/.dotfiles/config/wezterm/font.lua $HOME/.config/wezterm/font.lua;
            ln -s $HOME/.dotfiles/config/wezterm/cursor.lua $HOME/.config/wezterm/cursor.lua;
            ln -s $HOME/.dotfiles/config/wezterm/keybinds.lua $HOME/.config/wezterm/keybinds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/mouse_binds.lua $HOME/.config/wezterm/mouse_binds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/shell.lua $HOME/.config/wezterm/shell.lua;
            ln -s $HOME/.dotfiles/config/wezterm/utils.lua $HOME/.config/wezterm/utils.lua;
            ln -s $HOME/.dotfiles/config/wezterm/ui.lua $HOME/.config/wezterm/ui.lua;
            ln -s $HOME/.dotfiles/config/wezterm/startup.lua $HOME/.config/wezterm/startup.lua;
        case '*'
            # Do nothing
    end
end

function setup_terminator
    echo "**** Terminator ****"
    if test -f $HOME/.config/terminator/config
        mv $HOME/.config/terminator/config $HOME/.config/terminator/config.bak;
    end
    ln -s $HOME/.dotfiles/config/terminator/config $HOME/.config/terminator/config;
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
    mkdir -p $HOME/.config/tmux;
    rm -rf $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.tmux/plugins/tpm;
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.config/tmux;
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/tmux/tmux-linux.conf $HOME/.config/tmux/tmux.conf;
        case Darwin
            ln -s $HOME/.dotfiles/config/tmux/tmux-osx.conf $HOME/.config/tmux/tmux.conf;
    end
    # Install the plugins, inside the tmux press: <preffix>I
    # script to create and attach session in tmux using z oxide
    ln -s $HOME/.dotfiles/bin/t $HOME/Apps/t;
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

function setup_tilix
  ln -s $HOME/.dotfiles/config/tilix/ $HOME/.config/;
end

#setup_fish_shell
#setup_alacritty
#setup_starfish_prompt
#setup_tmux
#setup_zellij

