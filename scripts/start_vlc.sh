#! /bin/sh
LOOP="--loop"
MCAST_ADDR="239.192.10.60"
MCAST_PORT="1234"
HTTP_ADDR="localhost"
HTTP_PORT=8081
HTTP_URI="telenapf_live.ts"
SOUT_KEEP="--sout-keep --sout-mux-caching=30000 --sout-avcodec-strict=-2"
#SOUT_KEEP="--sout-keep --sout-mux-caching=30000"
VLC_BIN="/usr/bin/cvlc"
#VLC_BIN="/snap/bin/vlc"
## Bereitstellung Multicast Stream, Bereitstellung HTTP Stream zum Weiterverbreiten im Netz LU
## Bereitstellung als Flash Stream für Vorschau auf Web-GUI, Transcodierung auf h264 über alle Streams
SOUT_PARAM="#transcode{vcodec=h264,venc=x264{vbv-minrate=2048,vbv-maxrate=6144,qcomp=0,ratetol=0,keyint=15},vb=6144,scale=Auto,acodec=mpga,ab=128,channels=2,samplerate=44100}:duplicate{dst=\"duplicate{dst=gather:rtp{mux=ts{shaping=5000,use-key-frames},dst=${MCAST_ADDR},port=${MCAST_PORT}},dst=gather:std{access=http,dst=${HTTP_ADDR}:${HTTP_PORT}/${HTTP_URI},mux=ts}}\",dst=\"transcode{vcodec=h264,venc=x264{vbv-maxrate=2048,qcomp=0,ratetol=0,keyint=15},width=1280,height=720,vb=2048,scale=Auto,acodec=aac,ab=128,channels=2,samplerate=44100}:gather:std{access=http,mux=ffmpeg{mux=flv},dst=${HTTP_ADDR}:${HTTP_PORT}/stream.flv}\"}"
LOGFILE="/var/log/vlc/vlc-telenapf.log"
PIDFILE="/var/tmp/vlc-telenapf.pid"
PLAYLIST="$HOME/playlist_current.m3u"
#PLAYLIST="$HOME/Medien/playlist.m3u"
SOCKET="$HOME/vlc.sock"

export DISPLAY=:0
[ -e $PIDFILE ] && exit 1
$VLC_BIN $PLAYLIST --intf HTTP --extraintf oldrc --rc-unix $SOCKET --rc-fake-tty $LOOP --sout $SOUT_PARAM $SOUT_KEEP > $LOGFILE 2>&1 &
echo $! > $PIDFILE
