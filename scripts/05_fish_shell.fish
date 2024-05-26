#!/usr/bin/fish

function fish_shell
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

    # Coding
    ln -s $HOME/.dotfiles/config/fish/config-dev.fish $HOME/.config/fish/config-dev.fish;

    # Linux
    ln -s $HOME/.dotfiles/config/fish/config-linux.fish $HOME/.config/fish/config-linux.fish;

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

fish_shell
