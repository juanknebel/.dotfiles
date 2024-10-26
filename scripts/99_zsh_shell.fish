#!/usr/bin/fish

function zsh_shell_mac
  mv ~/.zshrc ~.zshrc.bak;
  touch ~/.zshrc;
  echo "export PATH=/opt/homebrew/bin:\$PATH" >> ~/.zshrc;
  echo "#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!" >> ~/.zshrc;
  echo "export SDKMAN_DIR=\"\$HOME/.sdkman\"" >> ~/.zshrc;;
  echo "[[ -s \"$HOME/.sdkman/bin/sdkman-init.sh\" ]] && source \"\$HOME/.sdkman/bin/sdkman-init.sh\"" >> ~/.zshrc
  echo "source /Users/jknebel/.config/broot/launcher/bash/br" >> ~/.zshrc;
  echo "eval \"\$(atuin init zsh)\"" >> ~/.zshrc;
  echo "# bindkey '^[[A' history-search-backward" >> ~/.zshrc;
  echo "# bindkey '^[[B' history-search-forward" >> ~/.zshrc;

  brew install powerlevel10k zsh-autosuggestions zsh-syntax-highlighting;
  echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc;
  echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc;
  echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc;
end

zsh_shell_mac
