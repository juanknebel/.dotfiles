# This is for my personal configuration for the terminal

### To install and configure oh-my-zsh

1. brew install zsh zsh-completions (replace brew install for any linux installer)
2. sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
3. Edit ~/.zshrc

## This is only for MacOs
### Move curser forward/backward one word
Alt <-- = Send Escape Sequence: b

Alt --> = Send Escape Sequence: f

### Move cursor to the start/end of the line
Cmd <-- = Send Hex Codes: 0x01

Cmd --> = Send Hex Codes: 0x05

### Slow iterm openning
rm -rf /var/log/asl/*.asl

### Change the hostname
Perform the following tasks to change the workstation hostname using the scutil command.

1. Open a terminal.
2. Type the following command to change the primary hostname of your Mac
	1. This is your fully qualified hostname, for example myMac.domain.com
	2. sudo scutil --set HostName <new host name>
3. Type the following command to change the Bonjour hostname of your Mac:
	1. This is the name usable on the local network, for example myMac.local.
	2. sudo scutil --set LocalHostName <new host name>
4. Optional: If you also want to change the computer name, type the following command:
	1. This is the user-friendly computer name you see in Finder, for example myMac.
	2. sudo scutil --set ComputerName <new name>
5. Flush the DNS cache by typing:
	1. dscacheutil -flushcache
6. Restart your Mac.

