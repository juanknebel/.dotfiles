#!/usr/bin/fish

function setup_terminator
    echo "**** Terminator ****"
    if test -f $HOME/.config/terminator/config
        mv $HOME/.config/terminator/config $HOME/.config/terminator/config.bak;
    end
    ln -s $HOME/.dotfiles/config/terminator/config $HOME/.config/terminator/config;
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

