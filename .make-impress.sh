#!/bin/bash

path=$(pwd)
date=`date '+%F_%H:%M:%S'`
# filename="USER INPUT"
read -p "Enter presentation name: " filename
mkdir $path/$filename
touch $path/$filename/$filename.html
# Affichage carte des feuilles de style:
ls $path/css
read -p "Choose your stylesheet: " stylesheet
read -p "Insert short description: " description

cat <<EOF > $path/$filename/$filename.html
<!--
FileName: $filename.html
Author  : Vicente Crestani
@edu    : vicente.crestani@edu.vs.ch
@pro    : vicente.crestani.eclat@fvaj.ch
Date    : $date
Descr.	: $description
-->
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>$filename</title>
	<link rel="stylesheet" href="../css/$stylesheet.css">
	<link rel="stylesheet" href="#">
	<link rel="stylesheet" href="#">
</head>
<body>
        
</body>
</html>
EOF
chown alpha:alpha $path/$filename/$filename.html
chmod u+rw $path/$filename/$filename.html
