#
#    ___ _   _  ___   _   _   _   __
#   |_  | | | |/ _ \ | \ | | | | / /
#     | | | | / /_\ \|  \| | | |/ /
#     | | | | |  _  || . ` | |    \
# /\__/ / |_| | | | || |\  | | |\  \
# \____/ \___/\_| |_/\_| \_/ \_| \_/
#
# Fish configurations for a better coding experience

## Rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

## Surreal db
set -U fish_user_paths $HOME/.surrealdb $fish_user_paths

## Go
set -U fish_user_paths /usr/local/go/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin/ $fish_user_paths

## Python
### Pyenv
# paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# init
#status is-login; and pyenv init --path | source
status --is-interactive; and pyenv init --path | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

### Poetry
set -U fish_user_paths $HOME/.poetry/bin $fish_user_paths

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

## Abbr

## pyenv
#create new virtual env
abbr pyv 'pyenv virtualenv'
#remove virtual env
abbr pyvrm 'pyenv virtualenv-delete'
#list virtual envs
abbr pyvls 'pyenv virtualenvs'
#activate virtual env
abbr pyvup 'pyenv activate'
#deactivate virtual env
abbr pyvdown 'pyenv deactivate'

### mvn
abbr mci 'mvn clean install'
abbr mcio 'mvn clean install -o'
abbr mcish 'mvn clean install -Dcheckstyle.skip'
abbr mcist 'mvn clean install -DskipTests'
abbr mcisct 'mvn clean install -Dcheckstyle.skip -DskipTests'
abbr mgs 'mvn generate-sources'
abbr mcom 'mvn compile'
abbr mtfast 'mvn test -o -Djacoco.skip=true -Dsurefire.useFile=false -Dsurefire.shutdown=kill -Dorg.slf4j.simpleLogger.showShortLogName=false -Dorg.slf4j.simpleLogger.defaultLogLevel=off -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.event=info'

## Git
abbr glog 'git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d %Creset%s"'
abbr gst 'git status'
abbr gsu 'git stash -u'
abbr gri 'git rebase -i'
abbr grc 'git rebase --continue'
abbr gau 'git add -u'
abbr gaa 'git add -A'
abbr gc 'git commit -m'
abbr gca 'git commit --amend'
abbr gp 'git push'
abbr gpf 'git push --force'
abbr gpuo 'git push -u origin'
abbr grmo 'git push origin :'
abbr grs 'git reset --soft HEAD~'
abbr grh 'git reset --hard'
abbr gwho 'git for-each-ref refs/remotes --format="%(authorname) %(refname)"'
abbr gdiff 'git diff'
abbr gco 'git checkout'
abbr gb 'git branch'
abbr gbr 'git branch -r'
abbr guo 'git branch -u origin/'
abbr gbu 'git branch -u'
abbr gfp 'git fetch -p'
abbr gwl 'git worktree list'
abbr gwa 'git worktree add'
abbr gwr 'git worktree remove'

## Zellij
abbr zru 'zellij -l ~/.config/zellij/layouts/rust-layout.kdl'
abbr zcode 'zellij -l ~/.config/zellij/layouts/default-code-layout.kdl'
abbr z4 'zellij -l ~/.config/zellij/layouts/four-panes-layout.kdl'
