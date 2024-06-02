#!/usr/bin/fish

function config_neovim
    pyenv virtualenv-delete pynvim;
    pyenv virtualenv 3.11.9 pynvim;
    $HOME/.pyenv/versions/3.11.9/envs/pynvim/bin/pip install pynvim;
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;
    # Nvim profile only to develop in java.
    unlink $HOME/.config/JavaNvim;
    ln -s $HOME/.dotfiles/config/JavaNvim $HOME/.config/JavaNvim;

    # Nvim abbr and repos
    unlink $HOME/.config/fish/config-abbr-nvim.fish;
    unlink $HOME/.config/fish/functions/nv.fish;
    rm -rf $HOME/.config/CyberNvim;
    rm -rf $HOME/.config/AstroNvim;
    rm -rf $HOME/.config/KickstarNvim;
    rm -rf $HOME/.config/NvChad;
    ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
    ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;
    git clone git@github.com:pgosar/CyberNvim.git ~/.config/CyberNvim;
    git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim;
    git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/KickstarNvim;
    git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1;
end

config_neovim
