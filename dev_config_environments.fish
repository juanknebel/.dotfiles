#!/usr/bin/fish

function setup_rust
    echo "**** RUST ****"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
    mkdir -p $HOME/.config/rustfmt;
    if test -f $HOME/.config/rustfmt/rustfmt.toml
        mv $HOME/.config/rustfmt/rustfmt.toml $HOME/rustfmt/rustfmt.toml.bak;
    end
    ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;
    rustup toolchain install nightly;
    rustup default nightly;
    rustup component add rust-analyzer;
    rustup component add clippy;
    rustup component add rustfmt;
    cargo install cargo-watch;
    cargo install cargo-audit;
    cargo install cargo-tarpaulin;
    cargo install du-dust;
    cargo install procs;
    cargo install --locked broot;
    cargo install skim;
    cargo install --locked bacon;
    cargo install --version 0.1.0-alpha.5 gobang;
    # For webassembly
    rustup target add wasm32-unknown-unknown;
    cargo install trunk;
    echo "Done."
end

function setup_python
    echo "**** PYTHON ****"
    echo "Pyenv"
    # Pyenv
    rm -rf ~/.pyenv;
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
    pyenv install 3.11;
    pyenv global system;
    pyenv local 3.11;
    pip install pyright;
    pip install pynvim;

    echo "Poetry"
    # Poetry
    curl -sSL https://install.python-poetry.org | python3 -;
    poetry completions fish > ~/.config/fish/completions/poetry.fish;
    echo "Done."
end

function setup_java
    echo "**** JAVA ****"
    echo "SDK Manager ..."
    curl -s "https://get.sdkman.io" | bash ;
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
    fisher install reitzig/sdkman-for-fish@v1.4.0;
    mkdir -p $HOME/.local/share/eclipse;
    curl https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml > $HOME/.local/share/eclipse/eclipse-java-google-style.xml;
    wget -O $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-latest.tar.gz;
    tar -xvf $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz -C $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz;
    rm $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz; 
    echo "Done."
end

function setup_nvm
    echo "**** NVM ****"
    fisher install jorgebucaran/nvm.fish;
    nvm install latest;
    nvm use latest;
    node -v > $HOME/.nvmrc;
    echo "Done."
end

function setup_neovim
    pip install pynvim;
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    rm -rf $HOME/.config/nvim/;
    ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;
end

function setup_skim
    echo "**** SKIM ****"
    mkdir -p $HOME/Apps
    ln -s $HOME/.dotfiles/preview.sh $HOME/Apps/preview.sh
end

#setup_rust
#setup_python
#setup_java
#setup_nvm
#setup_neovim
#setup_skim

