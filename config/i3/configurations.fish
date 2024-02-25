#/usr/bin/fish

sudo ln -s $HOME/.dotfiles/config/i3/resources/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf;
sudo ln -s $HOME/.dotfiles/config/i3/resources/lock@.service /usr/lib/systemd/system/lock@.service;
sudo systemctl enable lock@$USER.service;
ln -s $HOME/.dotfiles/config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf;
ln -s $HOME/.dotfiles/config/i3/config $HOME/.config/i3/config;
