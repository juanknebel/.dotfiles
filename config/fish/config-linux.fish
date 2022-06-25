#
#    ___ _   _  ___   _   _   _   __
#   |_  | | | |/ _ \ | \ | | | | / /
#     | | | | / /_\ \|  \| | | |/ /
#     | | | | |  _  || . ` | |    \
# /\__/ / |_| | | | || |\  | | |\  \
# \____/ \___/\_| |_/\_| \_/ \_| \_/
#
# Fish configurations for linux machines only

### Alias
# status with konsole
abbr stats-glances 'konsole --profile stats -e glances'
abbr stats-gpu 'konsole --profile stats -e gpustat -cp --watch'

### Snap
set -U fish_user_paths /snap/bin $fish_user_paths
