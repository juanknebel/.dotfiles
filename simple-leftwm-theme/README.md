# LeftWM Theme - Juan

A LeftWM theme late night coding sessions.

## Screenshots

## Dependencies

- leftwm
- feh
- polybar
- dunst
- rofi
- picom
- network-manager-applet
- blueman
- lxqt-powermanagment
- lxqt-policykit
- pcmanfm-qt
- pavucontrol-qt
- brightnessctl
- scrot
- i3lock

## Installation

```bash
pacman -S rofi picom dunst polybar network-manager-applet feh blueman lxqt-powermanagement lxqt-policykit pcmanfm-qt pavucontrol-qt brightnessctl scrot i3lock
```

In order to avoid blueman-applet in other desktops, add at the end of the file `/etc/xdg/autostart/blueman.desktop` this line.

```bash
NotShowIn=KDE;GNOME;
```

To use this theme

```bash
unlink ~/.config/leftwm/themes/current;
ln -s ~/.config/leftwm/themes/simple-leftwm-theme ~/.config/leftwm/themes/current;
cp ~/.config/leftwm/themes/simple-leftwm-theme/config/config.ron ~/.config/leftwm/config.ron;
```

## Attribution
