#!/bin/sh -e
apk update && apk upgrade
apk add rsync python3
rsync -rlptv --delete ftp.ibiblio.org::ldp_mirror /root/tldp
mkdir /root/tldp-pdf
find /root/tldp -name "*.pdf" -type f -exec cp {} /root/tldp-pdf/ +
tar -cvJf /root/tldp-pdf.txz -C /root tldp-pdf
/usr/bin/python3 -m http.server -d /root &

