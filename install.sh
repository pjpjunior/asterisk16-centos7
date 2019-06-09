#/bin/bash

yum update -y && yum install -y epel-release iptables-services && iptables -A INPUT -p udp --dport 5060 -j ACCEPT && iptables -A INPUT -p udp --dport 10000:20000 -j ACCEPT && service iptables save


yum install -y dmidecode gcc-c++ ncurses-devel libxml2-devel make wget openssl-devel newt-devel kernel-devel sqlite-devel libuuid-devel gtk2-devel  binutils-devel unzip bzip2 sox mpg123 ffmpeg sudo rpm-build libedit-devel ntp && ntpdate a.ntp.br && chkconfig ntpd on && sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config

cd /usr/src/ && git clone -b 16 http://gerrit.asterisk.org/asterisk asterisk16 && cd asterisk16

./configure --libdir=/usr/lib64 --with-jansson-bundled && make menuselect && make && make install && make samples && make config && make clean && make distclean && service asterisk start

adduser asterisk && passwd asterisk 


chown -R asterisk:asterisk /var/lib/asterisk/ && chown -R asterisk:asterisk /var/spool/asterisk/ && chown -R asterisk:asterisk /var/log/asterisk/ && chown -R asterisk:asterisk /var/run/asterisk/ && chown -R asterisk:asterisk /usr/sbin/asterisk && chown -R asterisk:asterisk /var/lib/asterisk/sounds/ && chown -R asterisk:asterisk /etc/asterisk
