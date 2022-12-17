#!/bin/sh
yum group install -y "Development Tools"
yum install -y wget
wget https://github.com/tuxera/ntfs-3g/archive/refs/tags/2022.5.17.tar.gz
tar xvf *.gz
cd nt* && ./autogen.sh
