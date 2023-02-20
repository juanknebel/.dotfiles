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

# Changing "ls" to "exa"
alias ls='exa -a --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias ltr='exa --sort=modified -l --color=always --group-directories-first' # last modified
alias l.='exa -a | grep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
# alias cp='cp -i'
# alias mv='mv -i'
# alias rm='rm -i'

### Abbr

# tmux
abbr txls 'tmux ls'
abbr txnw 'tmux new -t'
abbr txmain 'tmux new -t main'
abbr txrust 'tmux new -t rust -d'
abbr txgo 'tmux new -t go -d'
abbr txpy 'tmux new -t python -d'
abbr txjava 'tmux new -t java -d'
abbr txjet 'tmux new -t jetbrains -d'
abbr txmisc 'tmux new -t misc -d'
abbr txssh 'tmux new -t ssh -d'
abbr txat 'tmux a -t'
abbr txatmain 'tmux a -t main'
abbr txatrust 'tmux a -t rust'
abbr txatgo 'tmux a -t go'
abbr txatpy 'tmux a -t python'
abbr txatjava 'tmux a -t java'
abbr txatjet 'tmux a -t jetbrains'
abbr txatmisc 'tmux a -t misc'
abbr txatshh 'tmux a -t ssh'

# skim
#abbr skpr 'sk --preview "preview.sh {}"'
abbr skpr 'sk --preview "bat {} --color=always"'
abbr skim 'sk --ansi -i -c \'rg --color=always --line-number "{}"\''
abbr skimpr 'sk --ansi -i -c \'rg --color=always --line-number "{}"\' --preview "preview.sh {}"'
#abbr skimpr 'sk --ansi -i -c \'rg --color=always --line-number "{}"\' --preview "batcat {} --color=always"'

# get top process eating memory
abbr psmem 'ps auxf | sort -nr -k 4'
abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu ##
abbr pscpu 'ps auxf | sort -nr -k 3'
abbr pscpu10 'ps auxf | sort -nr -k 3 | head -10'
