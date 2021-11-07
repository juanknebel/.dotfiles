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
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/bin /usr/local/bin $fish_user_paths
set -U TMP $HOME/tmp

### EXPORT
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

### Config by OS
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    # Do nothing
end

### Config local
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

### Pyenv
# paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# init
#status is-login; and pyenv init --path | source
status --is-interactive; and pyenv init --path | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

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

# get top process eating memory
abbr psmem 'ps auxf | sort -nr -k 4'
abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu ##
abbr pscpu 'ps auxf | sort -nr -k 3'
abbr pscpu10 'ps auxf | sort -nr -k 3 | head -10'

# mvn
abbr mci 'mvn clean install'
abbr mcio 'mvn clean install -o'
abbr mcish 'mvn clean install -Dcheckstyle.skip'
abbr mcist 'mvn clean install -DskipTests'
abbr mcisct 'mvn clean install -Dcheckstyle.skip -DskipTests'
abbr mgs 'mvn generate-sources'
abbr mcom 'mvn compile'
abbr mtfast 'mvn test -o -Djacoco.skip=true -Dsurefire.useFile=false -Dsurefire.shutdown=kill -Dorg.slf4j.simpleLogger.showShortLogName=false -Dorg.slf4j.simpleLogger.defaultLogLevel=off -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.event=info'

# git
abbr glog 'git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d %Creset%s"'
abbr gst 'git status'
abbr gri 'git rebase -i'
abbr grc 'git rebase --continue'
abbr gau 'git add -u'
abbr gaa 'git add -A'
abbr gc 'git commit -m'
abbr gca 'git commit --amend'
abbr gpo 'git push origin'
abbr gpuo 'git push -u origin'
abbr grs 'git reset --soft HEAD~'
abbr grh 'git reset --hard'
abbr guo 'git branch -u origin/'
abbr gbu 'git branch -u'
