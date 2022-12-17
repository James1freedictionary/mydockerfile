#!/bin/sh
yum install --downloadonly --destdir /x $(yum group info "Development Tools" | sed "1,4d;23d;39d")
