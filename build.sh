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

apt-get install wget
# add package key 
wget -q $URL/Release.key -O- | apt-key add - 
#mkdir -p /var/src/debian/; cd /var/src/debian  
ls -l
apt-get update
apt-get source bareos
#apt-get build-dep bareos
apt-get install build-essential:native acl-dev autotools-dev bc chrpath debhelper git-core libacl1-dev libcap-dev libjansson-dev liblzo2-dev libqt4-dev libreadline-dev libssl-dev libwrap0-dev libx11-dev libsqlite3-dev libmysqlclient-dev libpq-dev logrotate lsb-release mtx ncurses-dev pkg-config po-debconf python-dev zlib1g-dev devscripts

cd bareos*
debuild -b -uc -us
