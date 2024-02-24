#!/usr/bin/fish

function config_wezterm
    echo "**** Wezterm ****"
    if test -f $HOME/.config/wezterm/wezterm.lua
        mv $HOME/.config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua.bak;
    end

    mkdir -p $HOME/.config/wezterm/;

    switch (uname)
        case Darwin
            ln -s $HOME/.dotfiles/config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua;
            ln -s $HOME/.dotfiles/config/wezterm/font.lua $HOME/.config/wezterm/font.lua;
            ln -s $HOME/.dotfiles/config/wezterm/cursor.lua $HOME/.config/wezterm/cursor.lua;
            ln -s $HOME/.dotfiles/config/wezterm/keybinds-osx.lua $HOME/.config/wezterm/keybinds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/mouse_binds.lua $HOME/.config/wezterm/mouse_binds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/shell-osx.lua $HOME/.config/wezterm/shell.lua;
            ln -s $HOME/.dotfiles/config/wezterm/utils.lua $HOME/.config/wezterm/utils.lua;
            ln -s $HOME/.dotfiles/config/wezterm/ui.lua $HOME/.config/wezterm/ui.lua;
            ln -s $HOME/.dotfiles/config/wezterm/startup-osx.lua $HOME/.config/wezterm/startup.lua;
        case Linux
            ln -s $HOME/.dotfiles/config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua;
            ln -s $HOME/.dotfiles/config/wezterm/font.lua $HOME/.config/wezterm/font.lua;
            ln -s $HOME/.dotfiles/config/wezterm/cursor.lua $HOME/.config/wezterm/cursor.lua;
            ln -s $HOME/.dotfiles/config/wezterm/keybinds.lua $HOME/.config/wezterm/keybinds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/mouse_binds.lua $HOME/.config/wezterm/mouse_binds.lua;
            ln -s $HOME/.dotfiles/config/wezterm/shell.lua $HOME/.config/wezterm/shell.lua;
            ln -s $HOME/.dotfiles/config/wezterm/utils.lua $HOME/.config/wezterm/utils.lua;
            ln -s $HOME/.dotfiles/config/wezterm/ui.lua $HOME/.config/wezterm/ui.lua;
            ln -s $HOME/.dotfiles/config/wezterm/startup.lua $HOME/.config/wezterm/startup.lua;
        case '*'
            # Do nothing
    end
end

config_wezterm
