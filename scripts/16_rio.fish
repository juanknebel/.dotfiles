#!/usr/bin/fish

function config_rio
    # themes: https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master
    echo "**** Rio ****"
    if test -f $HOME/.config/rio/config.toml
        mv $HOME/.config/rio/config.toml $HOME/.config/rio/config.toml.bak;
        rm -rf $HOME/.config/rio/themes;
    end

    mkdir -p $HOME/.config/rio/;

    ln -s $HOME/.dotfiles/config/rio/config.toml $HOME/.config/rio/config.toml;
    cp -R $HOME/.dotfiles/config/rio/themes $HOME/.config/rio/themes;
end

config_rio
