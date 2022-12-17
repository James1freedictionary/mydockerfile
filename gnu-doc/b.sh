#! /bin/bash 
apk update
apk add python3 wget coreutils utmps
root=/root
mkdir -p $root"/download" && cd $root"/download"
curl -O https://www.gnu.org/software/software.html
cat software.html | grep -o -E -e '<a href="[^/]*/"' | sed -e 's/<a href="//' -e 's/\/"//' | sed -e '1,385!d' | xargs -r -I {} wget -r -L https://www.gnu.org/software/{}/manual/
cd $root
mkdir -p $root"/gnu-doc/"
mkdir -p $root"/gnu-doc/dup"
find $root"/download/" -name "*.pdf" -exec cp -v --backup=numbered {} $root"/gnu-doc/" \;
find $root"/gnu-doc/" -name "*~*~" -exec mv -v {} $root"/gnu-doc/dup/" \;
find $root"/gnu-doc/dup" -name "*~*~" -exec mv -v {} {}.pdf \;
tar cvJf gnu-doc.txz -C $root gnu-doc/
python3 -m http.server -d $root &
echo "done!"
