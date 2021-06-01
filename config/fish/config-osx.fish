### Pyenv
# paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# init
status is-login; and pyenv init --path | source
pyenv init - | source

### Paths
set -U fish_user_paths /usr/local/sbin $fish_user_paths
