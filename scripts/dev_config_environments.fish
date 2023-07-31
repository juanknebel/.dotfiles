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

function setup_neovim
    pip install pynvim;
    rm -rf $HOME/.config/nvim;
    rm -rf $HOME/.local/share/nvim;
    rm -rf $HOME/.config/nvim/;
    ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim;
    ln -s $HOME/.dotfiles/config/nvim-lazy $HOME/.config/nvim;
end

function setup_helix
  rm -rf $HOME/.config/helix/;
  mkdir -p $HOME/.config/helix;
  ln -s $HOME/.dotfiles/config/helix/config.toml $HOME/.config/helix/config.toml;
  ln -s $HOME/.dotfiles/config/helix/languages.toml $HOME/.config/helix/languages.toml;
end

function setup_skim
    echo "**** SKIM ****"
    mkdir -p $HOME/Apps
    ln -s $HOME/.dotfiles/bin/preview.sh $HOME/Apps/preview.sh
    ln -s $HOME/.dotfiles/bin/sk-tmux $HOME/Apps/sk-tmux;
end

function setup_mc
    echo "**** MC ****"
    mkdir -p $HOME/.local/share/mc/skins && cd $HOME/.local/share/mc/skins && git clone https://github.com/catppuccin/mc.git && ln -s -f ./mc/catppuccin.ini .
    # Change or add skin=catppuccin in the [Midnight-Commander] section inside ~/.config/mc/ini
end

function setup_vscode
  echo "**** VSCODE ****"
  # In mac Ctrl+Shift+P and type shell
  # Install code in Path
  
  switch (uname)
        case Linux
            echo "Linux"
            mkdir -p $HOME/.config/Code/User;
            ln -s $HOME/.dotfiles/config/Code/User/settings.json $HOME/.config/Code/User/settings.json;
        case Darwin
            echo "MacOs"
            mkdir -p $HOME/Library/Application\ Support/Code/User;
            ln -s $HOME/.dotfiles/config/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.json;
        case '*'
            # Do nothing
    end
  
  
  code --install-extension 1YiB.rust-bundle
  code --install-extension bungcip.better-toml
  code --install-extension Catppuccin.catppuccin-vsc
  code --install-extension Catppuccin.catppuccin-vsc-icons
  code --install-extension Nord
  code --install-extension dustypomerleau.rust-syntax
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension ms-toolsai.jupyter
  code --install-extension ms-toolsai.jupyter-keymap
  code --install-extension ms-toolsai.jupyter-renderers
  code --install-extension ms-toolsai.vscode-jupyter-cell-tags
  code --install-extension ms-toolsai.vscode-jupyter-slideshow
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension rust-lang.rust-analyzer
  code --install-extension serayuzgur.crates
  code --install-extension vadimcn.vscode-lldb
  code --install-extension ms-python.isort
  code --install-extension redhat.java
  code --install-extension usernamehw.errorlens
  # code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
  # code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension vscjava.vscode-java-debug
  code --install-extension vscjava.vscode-java-dependency
  code --install-extension vscjava.vscode-java-pack
  code --install-extension vscjava.vscode-java-test
  code --install-extension vscjava.vscode-maven
end

function catppuccin
    echo "**** VSCODE ****"
    echo "Catppuccin for VSCode -> theme"
    echo "Catppuccin.catppuccin-vsc-icons -> icons"

    echo "**** Jetbrains ****"
    echo "Catppuccin Theme -> theme"

    echo "**** Firefox ****"
    echo "https://github.com/catppuccin/firefox"
end

#setup_rust
#setup_python
#setup_java
#setup_nvm
#setup_neovim
#setup_skim

