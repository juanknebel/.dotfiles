#!/usr/bin/env bash

THEME="$HOME/.config/leftwm/themes/current/rofi/powermenu.rasi"

rofi_command="rofi -no-config -theme $THEME"

# Options
shutdown="Shutdown"
reboot="Restart"
lock="Lock"
suspend="Suspend"
logout="Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
      systemctl poweroff
        ;;
    $reboot)
		  systemctl reboot
        ;;
    $lock)
      # xss-lock --transfer-sleep-lock -- i3lock --nofork
			i3lock --nofork -i ~/.config/leftwm/themes/current/wallpaper-blur.png -t
        ;;
    $suspend)
		  systemctl suspend;
			i3lock --nofork -i ~/.config/leftwm/themes/current/wallpaper-blur.png -t;
        ;;
    $logout)
      loginctl kill-session $XDG_SESSION_ID
        ;;
esac
