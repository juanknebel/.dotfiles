#!/usr/bin/fish

function config_tmux
    echo "**** TMUX ****"
    if test -f $HOME/.tmux.conf
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak;
    end
    mkdir -p $HOME/.config/tmux;
    rm -rf $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.tmux/plugins/tpm;
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.config/tmux;
    ln -s $HOME/.dotfiles/config/tmux/tmux-linux.conf $HOME/.config/tmux/tmux.conf;
    # Install the plugins, inside the tmux press: <preffix>I
    # script to create and attach session in tmux using z oxide
    ln -s $HOME/.dotfiles/bin/t $HOME/Apps/t;
    echo "Done."
end

function config_zellij
    echo "**** ZELLIJ ****"
    mkdir -p $HOME/.config/zellij/plugins;
    if test -f $HOME/.config/zellij/config.kdl
        mv $HOME/.config/zellij/config.kdl $HOME/.config/zellij/config.kdl.bak
    end
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/zellij/config-linux.kdl $HOME/.config/zellij/config.kdl;
        case Darwin
            ln -s $HOME/.dotfiles/config/zellij/config-osx.kdl $HOME/.config/zellij/config.kdl;
        case '*'
            # Do nothing
    end
    # ln -s $HOME/.dotfiles/config/zellij/rust-layout.kdl $HOME/.config/zellij/rust-layout.kdl;
    # ln -s $HOME/.dotfiles/config/zellij/rust-layout-default.kdl $HOME/.config/zellij/rust-layout-default.kdl;
    # ln -s $HOME/.dotfiles/config/zellij/default-code-layout.kdl $HOME/.config/zellij/default-code-layout.kdl;
    # ln -s $HOME/.dotfiles/config/zellij/four-panes-layout.kdl $HOME/.config/zellij/four-panes-layout.kdl;
    ln -s $HOME/.dotfiles/config/zellij/layouts $HOME/.config/zellij/layouts;

    # Downloading the plugins
    curl -LO https://github.com/imsnif/weather-pal/releases/latest/download/weather-pal.wasm -o $HOME/.config/zellij/plugins/;
    curl -LO https://github.com/imsnif/monocle/releases/latest/download/monocle.wasm -o $HOME/.config/zellij/plugins/;
    curl -LO https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm -o $HOME/.config/zellij/plugins/;
end

config_tmux
config_zellij
