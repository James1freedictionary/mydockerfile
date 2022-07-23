#!/bin/sh
set -e -v
#sed -i "1 i https://dl-cdn.alpinelinux.org/alpine/edge/community" /etc/apk/re*
apk update && apk add $(echo $(apk list font-noto* | grep -o -E "font-noto[-a-z]+0") | sed "s/-0//g") ttf-dejavu librsvg inkscape imagemagick texlive-full build-base tar wget perl graphviz python3 py3-pip 
pip install sphinx
wget https://github.com/torvalds/linux/archive/refs/tags/v5.19-rc4.tar.gz && tar xvf v*
cd li* && make SPHINXOPTS=-v pdfdocs
