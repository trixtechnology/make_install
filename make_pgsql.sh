#!/bin/bash
clear
echo ""
echo "========= Instalando e habilitando o PostgreSQL 9.6 "
echo ""
rpm -Uvh https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm

yum -y install postgresql96-server postgresql96-contrib

/usr/pgsql-9.6/bin/postgresql96-setup initdb

systemctl enable postgresql-9.6.service

systemctl start postgresql-9.6.service

echo ""
echo "========= Habilitando conexão via rede e senhas criptografadas no PostgreSQL 9.6 "
echo ""

sed -i 's/60d/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -i 's/64d/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -i 's/89d/g' /var/lib/pgsql/9.6/data/postgresql.conf

sed -i 's/59i\listen_addresses = '*'\/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -i 's/64i\port = 5432\/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -i 's/89i\password_encryption = on\/g' /var/lib/pgsql/9.6/data/postgresql.conf

echo ""
echo "========= Aplicando as permissões de conexão no PostgreSQL 9.6 "
echo ""

sed -i '\79,89d\' /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i '80i\local   all             all                                     peer\' /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i '81i\host    all             all             127.0.0.1/24            trust\' /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i '82i\host    all             all             172.0.0.0/24            md5\' /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i '83i\host    all             all             192.168.2.0/16          md5\' /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i '84i\host    all             all             ::1/128                 md5\' /var/lib/pgsql/9.6/data/pg_hba.conf