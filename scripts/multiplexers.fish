function setup_tmux
    echo "**** TMUX ****"
    if test -f $HOME/.tmux.conf
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak;
    end
    mkdir -p $HOME/.config/tmux;
    rm -rf $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.tmux/plugins/tpm;
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm;
    mkdir -p $HOME/.config/tmux;
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/tmux/tmux-linux.conf $HOME/.config/tmux/tmux.conf;
        case Darwin
            ln -s $HOME/.dotfiles/config/tmux/tmux-osx.conf $HOME/.config/tmux/tmux.conf;
    end
    # Install the plugins, inside the tmux press: <preffix>I
    # script to create and attach session in tmux using z oxide
    ln -s $HOME/.dotfiles/bin/t $HOME/Apps/t;
    echo "Done."
end

function setup_zellij
    echo "**** ZELLIJ ****"
    mkdir -p $HOME/.config/zellij;
    if test -f $HOME/.config/zellij/config.kdl
        mv $HOME/.config/zellij/config.kdl $HOME/.config/zellij/config.kdl.bak
    end
    switch (uname)
        case Linux
            ln -s $HOME/.dotfiles/config/zellij/config-linux.kdl $HOME/.config/zellij/config.kdl
        case Darwin
            ln -s $HOME/.dotfiles/config/zellij/config-osx.kdl $HOME/.config/zellij/config.kdl
        case '*'
            # Do nothing
    end
end

