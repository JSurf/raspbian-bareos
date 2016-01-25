#!/bin/sh
# define parameter 
# 
DIST=Debian_8.0 
# or 
# DIST=Debian_7.0 
# DIST=xUbuntu_14.04 
# DIST=xUbuntu_12.04 
URL=http://download.bareos.org/bareos/release/latest/$DIST/ 
 
# add the Bareos repository 
printf "deb-src $URL /\n" > /etc/apt/sources.list.d/bareos-src.list 
 
# add package key 
wget -q $URL/Release.key -O- | apt-key add - 
#mkdir -p /var/src/debian/; cd /var/src/debian 
 
apt-get update
apt-get source bareos
ls -l
#apt-get install bareos bareos-database-$DATABASE
