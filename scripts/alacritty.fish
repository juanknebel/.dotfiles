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

