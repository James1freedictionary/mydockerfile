#!/bin/bash -ev
exec &> >(tee log.txt)
#alpine 3.16
#echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/re*
#echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/re*

rep1=https://dl-cdn.alpinelinux.org/alpine/edge/community
rep2=https://dl-cdn.alpinelinux.org/alpine/edge/testing
sudo=/usr/bin/sudo

#add dep
apk update 
apk add git build-base sudo 
apk add sqlite 
apk add postgresql-dev postgresql postgresql-contrib 
apk add curl redis 
#apk add ghostscript-dev 
apk add imagemagick 
#apk add advancecomp gifsicle 
apk add jpegoptim #libjpeg-progs optipng pngcrush 
apk add pngquant jpeg 
apk add jhead --repository=$rep2
apk add oxipng --repository=$rep1
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
chmod -R a+rwx /usr/lib/ruby /usr/bin
$sudo -u postgres mkdir -p /root/data /run/postgresql
$sudo -u postgres initdb -D /root/data/pg
$sudo -u postgres postgres -D /root/data/pg &
$sudo -u postgres redis-server &

#start discourse
$sudo -u postgres git clone --depth=1 https://github.com/discourse/discourse /root/discourse
cd /root/discourse/
$sudo -u postgres bundle lock --add-platform x86_64-linux-musl
$sudo -u postgres bundle install
$sudo -u postgres yarn install
$sudo -u postgres bundle exec rake db:create
$sudo -u postgres bundle exec rake db:migrate
#export UNICORN_BIND_ALL=true
sed -i -e "/<</s:/.*/:/.*/:" config/environments/development.rb
$sudo -E -u postgres bundle exec rails server &
$sudo -u postgres bin/ember-cli &
