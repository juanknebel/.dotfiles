#!/usr/bin/fish

function config_git
    echo "**** GIT ****"
    if test -f $HOME/.gitignore_global
        mv $HOME/.gitignore_global $HOME/.gitignore_global.bak;
    end
    ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global;
    git config --global core.excludesfile $HOME/.gitignore_global;
    git config --global init.defaultBranch main;
    git config --global user.email "juanknebel@gmail.com";
    git config --global user.name "Juan Knebel";
    git config --global core.editor "nvim"
    echo "Done."
end

function config_rust
    echo "**** RUST ****"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
    mkdir -p $HOME/.config/rustfmt;
    if test -f $HOME/.config/rustfmt/rustfmt.toml
        mv $HOME/.config/rustfmt/rustfmt.toml $HOME/rustfmt/rustfmt.toml.bak;
    end
    ln -s $HOME/.dotfiles/config/rustfmt/rustfmt.toml $HOME/.config/rustfmt;
    rustup toolchain install nightly;
    rustup default stable;
    # rustup override set nightly; --> whenever is neccessary
    rustup component add rust-analyzer;
    rustup component add clippy;
    rustup component add rustfmt;
    # Cargo adds
    # cargo install cargo-watch;
    # cargo install cargo-audit;
    # cargo install cargo-tarpaulin;
    # cargo install cargo-generate;
    # cargo install cargo-udeps --locked;
    # cargo +stable install cargo-llvm-cov;
    # To handle database migrations
    # cargo install diesel_cli;
    # cargo install diesel_cli_ext;
    # For webassembly
    # rustup target add wasm32-unknown-unknown;
    # cargo install trunk;
    echo "Done."
end

function config_go
  echo "**** GO ****"
  curl -LO https://go.dev/dl/go1.21.1.linux-amd64.tar.gz;
  sudo tar -C /usr/local/ -xzf go1.21.1.linux-amd64.tar.gz;
  rm go1.21.1.linux-amd64.tar.gz;
  go install -v golang.org/x/tools/gopls@latest;
  go install github.com/go-delve/delve/cmd/dlv@latest;
  go install honnef.co/go/tools/cmd/staticcheck@latest;
  go install github.com/cosmtrek/air@latest;
end

function config_python
    echo "**** PYTHON ****"
    echo "Pyenv"
    # Pyenv
    rm -rf ~/.pyenv;
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
    git clone https://github.com/alefpereira/pyenv-pyright.git ~/.pyenv/plugins/pyenv-pyright;
    pyenv install 3.11;
    pyenv global system;
    # pyenv global 3.11;
    # pip install pyright;
    # pip install pynvim;
    # pip install black;
    # pip install python-lsp-server;
    # for arch
    sudo pacman -S python-lsp-server python-mccabe python-pycodestyle python-pydocstyle python-pyflakes  python-pylint python-rope autopep8 flake8 yapf python-whatthepatch pyright python-black python-nvim python-virtualenv;

    echo "Poetry"
    # Poetry
    curl -sSL https://install.python-poetry.org | python3 -;
    poetry completions fish > ~/.config/fish/completions/poetry.fish;
    echo "Done."
end

function config_java
    echo "**** JAVA ****"
    echo "SDK Manager ..."
    curl -s "https://get.sdkman.io" | bash;
    fisher install reitzig/sdkman-for-fish@v1.4.0;
    # mkdir -p $HOME/.local/share/eclipse/jdtls;
    # curl https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml > $HOME/.local/share/eclipse/eclipse-java-google-style.xml;
    # wget -O $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz "https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-latest.tar.gz";
    # tar -xvf $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz -C $HOME/.local/share/eclipse/jdtls/;
    # rm $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz;
    #reload the terminal 
    sdk install maven 3.9.9;
    sdk install java 17.0.13-zulu;
    echo "Done."
end

function config_nvm
    echo "**** NVM ****"
    fisher install jorgebucaran/nvm.fish;
    nvm install latest;
    nvm use latest;
    # node -v > $HOME/.nvmrc;
    echo "Done."
end

# config_git
config_rust
config_python
config_go
config_java
