#!/bin/bash
clear
echo ""
echo "========= Limpando a instalacao "
echo ""

yum clean all

#rm -rf  /var/cache/yum/

yum makecache

systemctl reboot