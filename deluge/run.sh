#!/bin/sh -e
sed -i -E "s/v[1-9.]+/edge/" /etc/apk/repositories
apk update && apk upgrade 
apk add deluge && apk upgrade
deluged
deluge-web
