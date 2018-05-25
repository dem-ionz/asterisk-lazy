#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
   echo "How the fuck am I supposed to do this shit without root accesss? Run me as root!"
   exit 1
fi

apt-get update
apt-get install build-essential
apt-get install git-core subversion libjansson-dev sqlite autoconf automake libxml2-dev libncurses5-dev libtool make -y
wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-15-current.tar.gz
tar -zxvf asterisk-15-current.tar.gz
cd asterisk-15.2.0
./contrib/scripts/install_prereq install
./configure 
make && make install
make samples
 make config
asterisk
echo "Connect to your Asterisk instance with asterisk -r for a pretty CLI!"
echo "I will now enable asterisk as a service for you."
systemctl enable asterisk
