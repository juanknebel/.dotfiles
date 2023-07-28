# 
#    ___ _   _  ___   _   _   _   __
#   |_  | | | |/ _ \ | \ | | | | / /
#     | | | | / /_\ \|  \| | | |/ / 
#     | | | | |  _  || . ` | |    \ 
# /\__/ / |_| | | | || |\  | | |\  \
# \____/ \___/\_| |_/\_| \_/ \_| \_/
#                                   
# My fish config file. https://github.com/juanknebel/.dotfiles

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/Apps $HOME/bin /usr/local/bin $fish_user_paths
set -U TMP $HOME/tmp

### EXPORT
set fish_greeting                                 # Supresses fish's intro message
#set TERM "xterm-256color"                         # Sets the terminal type
set TERM "screen-256color"                         # Sets the terminal type

### Config by OS
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    # Do nothing
end

### Config for Garuda
set GARUDA_CONFIG (dirname (status --current-filename))/config-garuda.fish
if test -f $GARUDA_CONFIG
  source $GARUDA_CONFIG
end

### Config local
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

### Config for conding
set DEV_CONFIG (dirname (status --current-filename))/config-dev.fish
if test -f $DEV_CONFIG
  source $DEV_CONFIG
end

### Config for aliases and abbr
set ALIAS_ABBR_CONFIG (dirname (status --current-filename))/config-alias-abbr.fish
if test -f $ALIAS_ABBR_CONFIG
  source $ALIAS_ABBR_CONFIG
end

### Start zoxide
zoxide init fish | source

### Start mcfly
mcfly init fish | source
set -gx MCFLY_KEY_SCHEME vim
set -gx MCFLY_FUZZY 2
set -gx MCFLY_RESULTS 50
set -gx MCFLY_RESULTS_SORT LAST_RUN # RANK
set -gx MCFLY_PROMPT "<<the-doc>>"
