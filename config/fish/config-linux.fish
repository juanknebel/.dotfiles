### Pyenv
# paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# init
status is-login; and pyenv init --path | source
pyenv init - | source

### Alias
# status with konsole
abbr stats-glances 'konsole --profile stats -e glances'
abbr stats-gpu 'konsole --profile stats -e gpustat -cp --watch'

### Snap
#set PATH /var/lib/snapd/snap/bin $PATH
