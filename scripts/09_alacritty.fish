#!/usr/bin/fish

function config_alacritty
    echo "**** Alacritty ****"
    if test -f $HOME/.config/alacritty/alacritty.toml
        mv $HOME/.config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml.bak;
    end

    switch (uname)
        case Darwin
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-osx.toml $HOME/.config/alacritty/alacritty.toml;
        case Linux
            ln -s $HOME/.dotfiles/config/alacritty/alacritty-linux.toml $HOME/.config/alacritty/alacritty.toml;
        case '*'
            # Do nothing
    end
    ln -s $HOME/.dotfiles/config/alacritty/themes/ $HOME/.config/alacritty/themes;
end

config_alacritty
