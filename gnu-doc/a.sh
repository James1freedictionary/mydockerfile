#!/bin/sh -e
apk update && apk upgrade
apk add rsync python3
url=
target_prefix=/root
target_dir=gnu-doc
target=$target_prefix"/"$target_dir
rsync -rlptv --delete $url | grep "*.pdf" > $target"/list.txt"
mkdir $target"/dowload/"
xargs -a $target"/list.txt" -I {} -P 5 rsync "$url"{} $target"/download/" 
mkdir $target"-pdf"
find $target"/download/" -name "*.pdf" -exec cp {} $target"-pdf/" +
tar -cvJf $target"-pdf.txz" -C $target_prefix $target_dir"-pdf"
/usr/bin/python3 -m http.server -d $target_prefix &

