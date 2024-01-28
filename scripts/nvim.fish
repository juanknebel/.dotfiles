function setup_neovim
    pip install pynvim;
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;
    ln -s $HOME/.dotfiles/config/nvim-lazy $HOME/.config/nvim-lazy;

    # Nvim abbr and repos
    ln -s $HOME/.dotfiles/config/fish/config-abbr-nvim.fish $HOME/.config/fish/config-abbr-nvim.fish;
    git clone git@github.com:pgosar/CyberNvim.git ~/.config/CyberNvim:
    git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim;
    git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/KickstarNvim;
    git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1;
    ln -s $HOME/.dotfiles/config/fish/functions/nv.fish $HOME/.config/fish/functions/nv.fish;
end

