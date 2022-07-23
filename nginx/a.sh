#!/bin/sh -e
wget https://transfer.sh/652dn3/B78.tar_0.ab https://transfer.sh/sp5rKq/B78.tar_0.aa https://transfer.sh/VXYEr8/B78.tar_0.ac
cat B*aa B*ab B*ac \
   | tar xvf -
apk update && apk add go nginx apache2-utils
sed -i -E "3 s/nginx/root/" /etc/nginx/nginx.conf
cat /etc/nginx/conf.d/d* | tr "\n" "\r" | sed "s/{.*}/{listen 80;location \/ {alias \/root\/;autoindex on;}}/" | tr "\r" "\n" > /etc/nginx/conf.d/new.conf
rm /etc/nginx/conf.d/d*
if [ ! -d "/run/nginx" ]; then
mkdir /run/nginx
fi
nginx
