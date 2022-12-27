#!/bin/bash -e
exec &> >(tee log.txt)
apk update && apk upgrade
apk add rsync python3 coreutils
rsync -rlptv --delete ftp.ibiblio.org::ldp_mirror /root/tldpv1
mkdir /root/tldpv1-pdf
mkdir /root/tldpv1-pdf/dup
find /root/tldpv1 -name "*.pdf" -exec cp -v --backup=numbered {} /root/tldpv1-pdf/ \;
find /root/tldpv1-pdf -name "*~*~" -exec mv -v {}  /root/tldpv1-pdf/dup/ \; 
find /root/tldpv1-pdf/dup -name "*~*~" -exec mv -v {} {}.pdf \; 
tar -cvJf /root/tldpv1-pdf.txz -C /root tldpv1-pdf
/usr/bin/python3 -m http.server -d /root &

