function setup_vscode
  echo "**** VSCODE ****"
  # In mac Ctrl+Shift+P and type shell
  # Install code in Path
  echo "Catppuccin for VSCode -> theme"
  echo "Catppuccin.catppuccin-vsc-icons -> icons"
  mkdir -p $HOME/.config/Code/User;
  ln -s $HOME/.dotfiles/config/Code/User/settings.json $HOME/.config/Code/User/settings.json;
  
  code --install-extension 1YiB.rust-bundle
  code --install-extension arcticicestudio.nord-visual-studio-code
  code --install-extension Avetis.nord-palette
  code --install-extension Catppuccin.catppuccin-vsc
  code --install-extension Catppuccin.catppuccin-vsc-icons
  code --install-extension ckolkman.vscode-postgres
  code --install-extension dustypomerleau.rust-syntax
  code --install-extension enkia.tokyo-night
  code --install-extension GitHub.github-vscode-theme
  code --install-extension golang.go
  code --install-extension Gruntfuggly.todo-tree
  code --install-extension marlosirapuan.nord-deep
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.isort
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension ms-toolsai.jupyter
  code --install-extension ms-toolsai.jupyter-keymap
  code --install-extension ms-toolsai.jupyter-renderers
  code --install-extension ms-toolsai.vscode-jupyter-cell-tags
  code --install-extension ms-toolsai.vscode-jupyter-slideshow
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension redhat.java
  code --install-extension rust-lang.rust-analyzer
  code --install-extension serayuzgur.crates
  code --install-extension tamasfe.even-better-toml
  code --install-extension usernamehw.errorlens
  code --install-extension vadimcn.vscode-lldb
  code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
  code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension vscjava.vscode-java-debug
  code --install-extension vscjava.vscode-java-dependency
  code --install-extension vscjava.vscode-java-pack
  code --install-extension vscjava.vscode-java-test
  code --install-extension vscjava.vscode-maven
  code --install-extension vscodevim.vim
end

