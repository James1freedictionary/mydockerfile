#! /bin/bash -e
exec > >(tee log.txt)
wget https://transfer.sh/g46LB2/tldpv1-pdf.txz
tar xvf tldpv1-pdf.txz
python3 -m http.server &
du -sh tldpv1-pdf
