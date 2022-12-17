#!/bin/sh -e
apk update && apk upgrade
apk add rsync
rsync -rlptv --delete ftp.ibiblio.org::ldp_mirror /root/tldp
