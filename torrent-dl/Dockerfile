FROM node:alpine
WORKDIR /target
RUN apk update && npm i -g torrent-dl
#RUN apt update && apt install -y wget && wget https://github.com/pigeonburger/torrent-dl/releases/download/v1.4.2/torrent-dl-linux-x6
RUN echo "magnet:?xt=urn:btih:3e3ee4c6756af017fc6cfa2e4eac8656727fb461&dn=Ben.10.Omniverse.Season.1.to.8.Complete.Series.720p.WEB-DL.x264&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Fzer0day.ch%3A1337&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fexodus.desync.com%3A6969" > torrent.torrent
RUN cat torrent.torrent | xargs torrent-dl -i
CMD sh

