#!/usr/bin/fish

function init
    echo "**** INIT ****"
    git clone git@github.com:juanknebel/.dotfiles.git;
    mkdir -p $HOME/git;
    echo "Done."
end

function setup_git
    # SSH
    # ssh-keygen -t ed25519 -b 4096 -C "juanknebel@gmail.com";
    # eval (ssh-agent -c);
    # ssh-add $HOME/.ssh/id_ed25519;
    # xclip -selection clipboard < $HOME/.ssh/id_ed25519.pub;
    # pbcopy < $HOME/.ssh/id_ed25519.pub; #for macos
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

function setup_rust
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
    cargo install cargo-watch;
    cargo install cargo-audit;
    cargo install cargo-tarpaulin;
    cargo install cargo-generate;
    cargo install cargo-udeps --locked;
    cargo +stable install cargo-llvm-cov;
    # To handle database migrations
    cargo install diesel_cli;
    cargo install diesel_cli_ext;
    # For webassembly
    rustup target add wasm32-unknown-unknown;
    cargo install trunk;
    echo "Done."
end

functon setup_go
  echo "**** GO ****"
  curl -LO https://go.dev/dl/go1.21.1.linux-amd64.tar.gz;
  tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz;
  go install -v golang.org/x/tools/gopls@latest;
  go install github.com/go-delve/delve/cmd/dlv@latest;
  go install honnef.co/go/tools/cmd/staticcheck@latest;
  go install github.com/cosmtrek/air@latest;
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
    # pyenv global 3.11;
    pip install pyright;
    pip install pynvim;
    pip install black;

    echo "Poetry"
    # Poetry
    curl -sSL https://install.python-poetry.org | python3 -;
    poetry completions fish > ~/.config/fish/completions/poetry.fish;
    echo "Done."
end

function setup_java
    echo "**** JAVA ****"
    echo "SDK Manager ..."
    curl -s "https://get.sdkman.io" | bash;
    fisher install reitzig/sdkman-for-fish@v1.4.0;
    mkdir -p $HOME/.local/share/eclipse/jdtls;
    curl https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml > $HOME/.local/share/eclipse/eclipse-java-google-style.xml;
    wget -O $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz "https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-latest.tar.gz";
    tar -xvf $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz -C $HOME/.local/share/eclipse/jdtls/;
    rm $HOME/.local/share/eclipse/jdtls/jdtls-latest.tar.gz;
    #reload the terminal 
    sdk install maven 3.9.2;
    sdk install java 8.0.372-zulu;
    sdk install java 11.0.19-zulu;
    sdk install java 17.0.7-zulu;
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

function catppuccin
    echo "**** Jetbrains ****"
    echo "Catppuccin Theme -> theme"

    echo "**** Firefox ****"
    echo "https://github.com/catppuccin/firefox"
end

