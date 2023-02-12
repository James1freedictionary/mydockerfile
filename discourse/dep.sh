#!/bin/bash -ev
#alpine 3.16
echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/re*
echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/re*

#add dep
apk update 
apk add git build-base 
apk add sqlite 
apk add postgresql-dev postgresql postgresql-contrib curl redis imagemagick 
#apk add advancecomp gifsicle 
apk add jpegoptim #libjpeg-progs optipng pngcrush 
apk add pngquant jhead oxipng
apk add npm nodejs ruby ruby-dev
gem update --system
gem install rails
gem install bundler
wget -qO /usr/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.1/MailHog_linux_amd64
chmod +x /usr/bin/mailhog
npm install -g svgo
npm install -g yarn

#start database
chmod -R a+rwx /root
chmod -R a+rwx /run
sudo -u postgres mkdir /root/data /run/postgresql
sudo -u postgres initdb -D /root/data/pg
sudo -u postgres postgres -D /root/data/pg &
sudo -u postgres redis-server &

#start discourse
sudo -u postgres git clone https://github.com/discourse/discourse ~/discourse
sudo -u postgres bundle lock --add-platform x86_64-linux-musl
sudo -u postgres bundle install
sudo -u postgres yarn install
sudo -u postgres bundle exec rake db:create
sudo -u postgres bundle exec rake db:migrate
export UNICORN_BIND_ALL=true
sudo -u postgres bundle exec rails server &
