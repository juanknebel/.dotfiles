#!/usr/bin/fish

function config_helix
  echo "**** Helix ****"
  rm -rf $HOME/.config/helix/;
  mkdir -p $HOME/.config/helix;
  ln -s $HOME/.dotfiles/config/helix/config.toml $HOME/.config/helix/config.toml;
  ln -s $HOME/.dotfiles/config/helix/languages.toml $HOME/.config/helix/languages.toml;
end

config_helix
