#! /bin/bash
USER=telenapf
PASSWORD=kasViUlact4
OUTFILE=~/playlist_current.m3u

echo "#EXTM3U" > $OUTFILE
wget --no-check-certificate --user=$USER --password=$PASSWORD -qO- http://localhost/vlc/requests/playlist.xml | while read line
do
  if ! echo $line | grep "leaf " >/dev/null; then
    continue
  fi
  duration=$(echo $line | sed -e 's:^.*duration="\([^"]\+\)".*$:\1:')
  name=$(echo $line | sed -e 's:^.*name="\([^"]\+\)".*$:\1:')
  uri=$(echo $line | sed -e 's:^.*uri="\([^"]\+\)".*$:\1:')
  echo "#EXTINF:$duration,$name" >> $OUTFILE
  echo "$uri" >> $OUTFILE
done
