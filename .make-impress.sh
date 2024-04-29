#!/bin/bash

path="$(dirname -- "$(readlink -f "$BASH_SOURCE")")"
date=`date '+%F_%H:%M:%S'`
# filename="USER INPUT"
tree -dli -I "css|example|extras|js|src" -L 1 $path
read -p "Choose your project directory : " pdir
ls $path/examples
read -p "Choose type of presentation : " template
read -p "Enter presentation name : " filename
cp -r $path/examples/$template/ $path
mv $path/$template $path/$pdir/$filename/
read -p "Insert short description: " description

cat <<EOF > $path/$pdir/$filename/$filename.html
<!--
FileName: $filename.html
Author  : Vicente Crestani
@edu    : vicente.crestani@edu.vs.ch
@pro    : vicente.crestani.eclat@fvaj.ch
template: $template
Date    : $date
Descr.	: $description
-->
EOF
cat $path/$pdir/$filename/index.html >> $path/$pdir/$filename/$filename.html
mv $path/$pdir/$filename/index.html $path/$pdir/$filname/example.html
chown alpha:alpha $path/$pdir/$filename/$filename.html
chmod u+rw $path/$pdir/$filename/$filename.html
