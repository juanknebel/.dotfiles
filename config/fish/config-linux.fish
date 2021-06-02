### Pyenv
# init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

### Alias
# status with konsole
alias stats-glances='konsole --profile stats -e glances'
alias stats-gpu='konsole --profile stats -e gpustat -cp --watch'

### Snap
#set PATH /var/lib/snapd/snap/bin $PATH
