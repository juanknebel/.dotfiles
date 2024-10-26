#!/usr/bin/fish

function config_neovim
    pyenv virtualenv-delete pynvim;
    pyenv virtualenv 3.11.10 pynvim;
    $HOME/.pyenv/versions/3.11.10/envs/pynvim/bin/pip install pynvim;

    # Nvim default
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    rm -rf $HOME/.local/state/nvim;
    git clone https://github.com/NvChad/starter $HOME/.config/nvim;
    rm -rf $HOME/.config/nvim/.git;
    #ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;

    # Nvim abbr and repos
    unlink $HOME/.config/fish/config-abbr-nvim.fish;
    unlink $HOME/.config/fish/functions/nv.fish;
    ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
    ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;

    # Nvim for rust
    rm -rf $HOME/.config/nvim-rust;
    rm -rf $HOME/.local/share/nvim-rust;
    rm -rf $HOME/.local/state/nvim-rust;
    ln -s $HOME/.dotfiles/config/nvim-rust/ $HOME/.config/nvim-rust;

    # Nvim for go
    rm -rf $HOME/.config/nvim-go;
    rm -rf $HOME/.local/share/nvim-go;
    rm -rf $HOME/.local/state/nvim-go;
    ln -s $HOME/.dotfiles/config/nvim-go/ $HOME/.config/nvim-go;
    
    # Nvim for python
    # rm -rf $HOME/.config/nvim-python;
    # rm -rf $HOME/.local/share/nvim-python;
    # rm -rf $HOME/.local/state/nvim-python;
    # ln -s $HOME/.dotfiles/config/nvim-python/ $HOME/.config/nvim-python;

    # Nvim for java
    # rm -rf $HOME/.config/nvim-java;
    # rm -rf $HOME/.local/share/nvim-java;
    # rm -rf $HOME/.local/state/nvim-java;
    # ln -s $HOME/.dotfiles/config/nvim-java/ $HOME/.config/nvim-java;
end

config_neovim
