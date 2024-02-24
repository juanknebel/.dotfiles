#!/usr/bin/fish

function starship_prompt
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

starship_prompt
