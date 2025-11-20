#! /bin/sh
echo "clear" | nc -U vlc.sock
echo "add /home/telenapf/Medien/playlist.m3u" | nc -U vlc.sock

