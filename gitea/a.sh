#!/bin/bash -ev
apk update && apk add postgresql gitea
pg=`cat /etc/passwd | grep postgres | sed -e "s/:.*//"`
if [ "$pg" != "postgres"];then
adduser -D postgres
fi
gt=`cat /etc/passwd | grep gitea | sed -e "s/:.*//"`
if [ "$gt" != "gitea" ]; then
adduser -D gitea
fi
su postgres initdb -D /root/pg
echo "local gitea 	gitea peer" >> /root/pg/\
pg_hba.conf
su postgres postgres -k /root/sock/ -D /root/pg
su postgres createuser -h /root/sock/ gitea
su postgres createdb -h /root/sock -O gitea gitea
export GITEA_WORK_DIR=/root/gitea
giteaini=/root/app.ini
echo -e "DB_TYPE             = postgres \n\
HOST                = /root/sock/ \n\
NAME                = gitea \n\
USER                = gitea \n\
PASSWD              = \n\
HTTP_ADDR           = 0.0.0.0" > $giteaini

su gitea gitea web --config $giteaini
