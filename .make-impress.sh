#!/bin/bash

path=$(pwd)
date=`date '+%F_%H:%M:%S'`
# filename="USER INPUT"
tree -dli -I "css|example|extras|js|src" -L 1
read -p "Choose your project directory : " pdir
ls $path/examples
read -p "Choose type of presentation : " template
read -p "Enter presentation name : " filename
cp -r $path/examples/$template/ .
mv $template $pdir/$filename
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
cat $pdir/$filename/index.html >> $pdir/$filename/$filename.html
mv $pdir/$filename/index.html $pdir/$filname/example.html
chown alpha:alpha $path/$pdir/$filename/$filename.html
chmod u+rw $path/$pdir/$filename/$filename.html
