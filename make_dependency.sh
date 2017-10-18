#!/bin/bash
clear
echo ""
echo "========= Instalando e Configurando o Asterisk 15.x no CentOS 7 "
echo ""

yum -y install epel-release

yum -y groupinstall 'Development Tools'

yum -y install kernel git nmap tcpdump rsync traceroute iptraf iperf \
vim ntpdate screen less unzip bzip2 multitail htop ngrep  \
pptpd mlocate net-tools bash-completion vim wget curl bzip2 \
dmidecode make openssl ncurses newt libxml2 gcc gcc-c++ sqlite\
uuid sox jansson libxslt gmime neon iksemel libical libsrtp \
libogg libvorbis libcurl speex unixODBC ncurses-devel libxml2-devel \
openssl-devel newt-devel kernel-devel sqlite-devel libuuid-devel \
gtk2-devel jansson-devel binutils-devel perl

echo ""
echo "========= Desabilitando o SELINUX "
echo ""

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

sestatus

echo ""
echo "========= Atualizando o Sistema Operacional "
echo ""

yum update -y