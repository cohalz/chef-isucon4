#!/bin/sh
set -x
set -e
cd $(dirname $0)

myuser=isucon
mydb=isu4_qualifier
myhost=10.0.0.4
myport=3306
mypass=isucon
mysql -h ${myhost} -P ${myport} -u ${myuser} -p${mypass} -e "DROP DATABASE IF EXISTS ${mydb}; CREATE DATABASE ${mydb}"
mysql -h ${myhost} -P ${myport} -u ${myuser} -p${mypass} ${mydb} < sql/schema.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -p${mypass} ${mydb} < sql/dummy_users.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -p${mypass} ${mydb} < sql/dummy_log.sql
