#! /bin/sh

#apt update && apt install -y build-essential
wget http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/ncurses_6.3.orig.tar.gz && tar xvf n*
cd nc* && ./configure && make && make install
wget https://github.com/vim/vim/archive/refs/tags/v9.0.0096.tar.gz && tar xvf v*
cd vim* && make && make install
