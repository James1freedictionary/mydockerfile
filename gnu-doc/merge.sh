#! /bin/bash -e
exec &> >(tee log.txt)
apk update
apk add python3 wget xz tar coreutils
url1=https://transfer.sh/get/OodviY/gnu-doc.txz
url2=https://transfer.sh/get/rSFN1b/gnu-docv2.txz
wget $url1
wget $url2
tar -xvf gnu-doc.txz 
tar -xvf gnu-docv2.txz
cp -v gnu-docv2/* gnu-doc/
mv -v gnu-doc gnu-docv3
tar cvJf gnu-docv3.txz gnu-docv3/
python3 -m http.server &
echo "---done!---"
