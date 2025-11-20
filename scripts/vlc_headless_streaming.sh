cvlc playlist.m3u --extraintf HTTP --http-port 8081 --http-password "Stream.16" --loop --sout "#duplicate{dst=rtp{dst=239.192.10.60,port=1234,mux=ts},dst=std{access=http,mux=flv,dst=localhost:8081/stream.flv}" &

#Damit das Flash-Player Interface funktioniert, muss auf dem Client ein SSH-Tunnel eingerichtet werden:
#ssh -p 2223 -L 8081:localhost:8081 telenapf@213.213.160.26
#Danach folgende URL für den Zugriff auf das Web-Interfaceverwendet werden:
#http://localhost:8081
#(da leider der Flash Player fix auf localhost eingerichetet ist).


