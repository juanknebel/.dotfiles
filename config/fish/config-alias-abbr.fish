#
#    ___ _   _  ___   _   _   _   __
#   |_  | | | |/ _ \ | \ | | | | / /
#     | | | | / /_\ \|  \| | | |/ /
#     | | | | |  _  || . ` | |    \
# /\__/ / |_| | | | || |\  | | |\  \
# \____/ \___/\_| |_/\_| \_/ \_| \_/
#
# Fish configurations for a aliases and abbr

### Aliases

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Changing "ls" to "eza"
alias ls="eza --icons"
alias la="eza --icons -a"
alias ll="eza -l --icons --git -a"
alias lr="eza -l --sort modified --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Common
alias ip="ip -color"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias cl='clear'
alias http="xh"

### Abbr

abbr chead 'curl -s -D - -o  /dev/null'

# tmux
abbr txls 'tmux ls'
abbr txs "tmux new -As (pwd | sed 's/.*\///g')"
abbr txnw 'tmux new -As'
abbr txat 'tmux a -t'
abbr txas "tmux a -t (pwd | sed 's/.*\///g')"
abbr txzoidberg "tmux new -d -s zoidberg 'ssh elmo@192.168.1.56 -t fish'"

# Open files in neovim using skim
abbr vsk 'fd --type f --hidden --exclude .git | sk-tmux --prompt "==>" --preview "bat {} --color=always"| xargs nvim'
# Using fzf
abbr vf "fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
abbr vfr "fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"


# skim
#abbr skpr 'sk --preview "preview.sh {}"'
abbr skpr 'sk --preview "bat {} --color=always"'
#abbr skim 'sk --ansi -i -c \'rg --color=always --line-number "{}"\''
#abbr skimpr 'sk --ansi -i -c \'rg --color=always --line-number "{}"\' --preview "preview.sh {}"'
#abbr skimpr 'sk --ansi -i -c \'rg --color=always --line-number "{}"\' --preview "batcat {} --color=always"'

# get top process eating memory
abbr psmem 'procs --sortd mem'
#abbr psmem 'ps auxf | sort -nr -k 4'
#abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu ##
abbr pscpu 'procs --sortd cpu'
#abbr pscpu 'ps auxf | sort -nr -k 3'
#abbr pscpu10 'ps auxf | sort -nr -k 3 | head -10'

# Setting NVIM configurations
set NVIM_ABBR_CONFIG (dirname (status --current-filename))/config-abbr-nvim.fish
if test -f $NVIM_ABBR_CONFIG
  source $NVIM_ABBR_CONFIG
end
