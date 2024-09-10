# LeftWM Theme - Juan

A LeftWM theme late night coding sessions.

## Screenshots

## Dependencies

**Apps**

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
- bluetui

**Fonts**

- MesloLGS NF
- Noto Sans Symbols 2 (for some symbols in polybar)

## Installation

Checkout main branch of this repos and follow their respective README.

```bash
cd ~/git;
git clone https://github.com/leftwm/leftwm.git;
git clone https://github.com/leftwm/leftwm-theme;
git clone https://github.com/leftwm/leftwm-config.git;
```

```bash
pacman -S rofi picom dunst polybar network-manager-applet feh blueman lxqt-powermanagement lxqt-policykit pcmanfm-qt pavucontrol-qt brightnessctl scrot i3lock
yay -S bluetui
```

In order to avoid blueman-applet in other desktops, add at the end of the file `/etc/xdg/autostart/blueman.desktop` this line.

```bash
NotShowIn=KDE;GNOME;
```

To use natural scrolling edit the following file `/usr/share/X11/xorg.conf.d/40-libinput.conf` and add the line:

```bash
Option "NaturalScrolling" "True"
```

Or add this file `/etc/X11/xorg.conf.d/90-touchpad.conf`

```bash
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "true"
        # Option "ScrollMethod" "edge"
EndSection
```

To use this theme

```bash
unlink ~/.config/leftwm/themes/current;
ln -s ~/.config/leftwm/themes/simple-leftwm-theme ~/.config/leftwm/themes/current;
mv ~/.config/leftwm/config.ron ~/.config/leftwm/config.ron.bak;
ln -s ~/.dotfiles/simple-leftwm-theme/config/config.ron ~/.config/leftwm/config.ron;
```

## Attribution
