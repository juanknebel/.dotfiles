#!/bin/sh
song=$(playerctl --player=spotifyd metadata --format "Title: {{ title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
notify-send "Spotify" "$song" --icon=$HOME/.config/spotifyd/spotify.png
