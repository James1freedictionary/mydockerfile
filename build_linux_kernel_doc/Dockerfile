FROM alpine
RUN apk update && apk add alpine-sdk wget python3 py3-pip texlive-xetex perl graphviz tar
WORKDIR /target
RUN wget https://github.com/torvalds/linux/archive/refs/tags/v5.19-rc4.tar.gz && tar xvf v*
RUN cd linux* && make pdfdocs
CMD sh
