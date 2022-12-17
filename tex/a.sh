#!/bin/sh
apk update && apk add rsync build-base libxaw-dev fontconfig-dev libxmu-dev libx11-dev
mkdir -p /root/x
#rsync -a --delete --exclude=.svn tug.org::tldevsrc/Build/source/ /root/x

rsync -a -P tug.org::tldevsrc/Build/source/ /root/x
cd /root/x && mkdir work && cd work && ../configure --prefix=/root/k
make && make install
