#!/usr/bin/fish

function install_fonts
    echo "**** INSTALLING FONTS ****"
    switch (uname)
        case Darwin
          set FONT_HOME $HOME/Library/Fonts;
        case Linux
          set FONT_HOME $HOME/.local/share/fonts;
        case '*'
          set FONT_HOME $HOME/.fonts;
    end
    mkdir -p $FONT_HOME;
    cd $HOME;
    curl -fLo firaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip;
    unzip firaCode.zip -d $FONT_HOME;
    rm firaCode.zip;
    curl -fLo 3270.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/3270.zip;
    unzip 3270.zip -d $FONT_HOME;
    rm 3270.zip;
    curl -fLo jetbrains.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip;
    unzip jetbrains.zip -d $FONT_HOME;
    rm jetbrains.zip;
    curl -fLo hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip;
    unzip hack.zip -d $FONT_HOME;
    rm hack.zip;
    fc-cahe -vf;
end

install_fonts
