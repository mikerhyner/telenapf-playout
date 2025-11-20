# telenapf-playout

Artifacts for Playout Sytem of Telenapf / Telezentralschweiz

Consisting of those main components:
* VLC
* FLVPLAYER (as a replacement for the obsolete Flash Player)
* FFMPEG
* Some scripts

## VLC (playout) part
Under scripts, there are all the scripts for start VLC for the Playout System. Short instructions for the VLC part:

<pre>
apt-get install vlc
useradd -m -G sudo,dip,video,plugdev,lpadmin -s /bin/bash telenapf
cp -r scripts/*.sh /home/telenapf/
chown telenapf:telenapf /home/telenapf/*.sh
cp scripts/vlc-telenapf_initscript to /etc/init.d/ # (i now, should be replaced by a systemd daemon)
cp scripts/ffmpeg.service /etc/systemd/system
systemctl daemon-reload
</pre>

Then start VLC for playout part:
`systemctl start vlc-telenapf`

## FFMPEG (SRT conversion) part
We have built a seperate FFMPEG for the system the playout runs on, but when build on a newer Ubuntu/Debian system, you should be able to just install the ffmpeg package:

`apt-get install ffmpeg`

Start FFMPEG (using the unit file copied above):

`systemctl start ffmpeg`

## Web (-GUI) part
Under web, there are some simple web pages for the entry screen and the flvplayer.

Short instructions:
- copy index.php, restart_vlc.php, style.css to /var/www/html (or where the web root may be): `cp web/*.php web/*.css /var/www/html/`
- go to /usr/share/vlc/lua/http: `cd /usr/share/vlc/lua/http`
- unpack vlc_flvplayer.tar.gz: `tar xvzf vlc_flvplayer.tar.gz`
- run patch to change the index.html to use flvplayer (instead of flash player): `patch -p0 <  vlc_flvplayer.patch`

(the last three steps have to be repeated when re-installing or updating vlc, because, afaik, it's web-gui stil uses flashplayer...)
