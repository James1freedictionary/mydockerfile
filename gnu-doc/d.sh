#! /bin/bash 
exec &> >(tee log.txt)
apk update
apk add python3 wget coreutils utmps
root=/root
mkdir -p $root"/download" && cd $root"/download"
curl -O https://www.gnu.org/software/software.html
cat software.html | grep -o -E -e '<a href="[^/]*/"' | sed -e 's/<a href="//' -e 's/\/"//' | sed -e '1,385!d' | xargs -r -I {} wget https://www.gnu.org/software/{}/manual/{}".pdf"
cd $root
mkdir -p $root"/gnu-docv2/"
find $root"/download/" -name "*.pdf" -exec cp -v --backup=numbered {} $root"/gnu-docv2/" \;
tar cvJf gnu-docv2.txz -C $root gnu-docv2/
python3 -m http.server -d $root &
echo "done!"
