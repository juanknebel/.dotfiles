#!/usr/bin/fish

function config_neovim
    pip install pynvim;
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;
    # Nvim profile only to develop in java.
    ln -s $HOME/.dotfiles/config/JavaNvim $HOME/.config/JavaNvim;

    # Nvim abbr and repos
    ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
    git clone git@github.com:pgosar/CyberNvim.git ~/.config/CyberNvim:
    git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim;
    git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/KickstarNvim;
    git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1;
    ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;
end

config_neovim
