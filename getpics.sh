#!/bin/bash

rm -r apod/
mkdir apod/
#rm ~/apod/*.jpg ~/apod/*.html ~/apod/*.txt
user=$(whoami)

cd apod/
wget http://apod.nasa.gov/apod/astropix.html
a='http://apod.nasa.gov/apod/'
grep '< *IMG' astropix.html > temp.txt
b=$(awk -F '"' '{print $2}' temp.txt) 
c=$a$b
wget $b
imname=$(ls *.gif)
echo $imname
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
rm temp.txt
cd ~/Desktop
