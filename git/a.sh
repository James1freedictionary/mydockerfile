#!/bin/sh -e
wget https://github.com/git/git/archive/refs/tags/v2.37.1.tar.gz
tar xvf *.gz
cd v*
apt update && apt install 
