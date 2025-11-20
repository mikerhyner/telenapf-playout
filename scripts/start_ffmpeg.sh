#! /bin/sh
SRC="http://localhost:8081/telenapf_live.ts"
DST="srt://:8082?mode=listener&latency=300000"
LOGFILE="/var/log/ffmpeg/ffmpeg_srt.log"
/usr/local/bin/ffmpeg -i ${SRC} -c:v copy -c:a copy -f mpegts ${DST} > $LOGFILE 2>&1
