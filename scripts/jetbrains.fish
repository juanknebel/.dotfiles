#!/usr/bin/fish

function config_jetbrains
  echo "**** Jetbrains ****"
  echo "**** IdeamVim  ****"
  ln -s $HOME/.dotfiles/config/.ideavimrc $HOME/;
end

config_jetbrains
