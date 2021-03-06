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

#apt-get build-dep bareos
apt-get install acl-dev autotools-dev bc chrpath git-core libacl1-dev libcap-dev libjansson-dev liblzo2-dev libqt4-dev libreadline-dev libssl-dev libwrap0-dev libx11-dev libsqlite3-dev libmysqlclient-dev libpq-dev logrotate lsb-release mtx ncurses-dev pkg-config po-debconf python-dev zlib1g-dev
apt-get --build source bareos
#ls -l
#cd bareos_15.2.2-37.1
#debuild -b -uc -us
