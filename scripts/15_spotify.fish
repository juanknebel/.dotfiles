pacman -S spotifyd
yay -S spotify-tui

mkdir $HOME/.config/systemd/user/;
cp $HOME/.dotfiles/config/services/spotifyd.service $HOME/.config/systemd/user;
ln -s $HOME/.dotfiles/bin/spotify-info.sh $HOME/Apps/spotify-info.sh;
ln -s $HOME/.dotfiles/config/spotifyd/spotify.png $HOME/.config/spotifyd/spotify.png;

systemctl --user enable spotifyd --now;
