FROM alpine
WORKDIR /target
COPY . .
RUN apk update && apk add npm && npm i -g torrent-dl
RUN cat torrent.torrent | xargs torrent-dl -i
CMD sh

