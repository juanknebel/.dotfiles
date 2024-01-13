function setup_helix
  rm -rf $HOME/.config/helix/;
  mkdir -p $HOME/.config/helix;
  ln -s $HOME/.dotfiles/config/helix/config.toml $HOME/.config/helix/config.toml;
  ln -s $HOME/.dotfiles/config/helix/languages.toml $HOME/.config/helix/languages.toml;
end

