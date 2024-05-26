#!/usr/bin/fish

function starship_prompt
    echo "**** STARSHIP PROMPT ****"
    echo 'starship init fish | source'>> $HOME/.config/fish/config-local.fish;
    if test -f $HOME/.config/starship.toml
        mv $HOME/.config/starship.toml $HOME/.config/starship.toml.bak
    end
    ln -s $HOME/.dotfiles/config/starship/starship.toml $HOME/.config/starship.toml;
    echo "Done."
end

starship_prompt
