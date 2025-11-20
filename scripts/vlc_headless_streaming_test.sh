#! /bin/sh
cvlc --lua-intf http testplaylist.m3u --loop --sout "#transcode{vcodec=mp4v,acodec=mpga,v800,ab=128,deinterlace}:file{dst=/tmp/teststream.mp4}"
