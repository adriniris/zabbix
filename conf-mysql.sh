#!/bin/bash

# Antes de nada arrancamos el servicio mariadb

service mariadb start

# Variables de conexión a MySQL
HOST="localhost"
USER="root"
PASSWORD=""

# Conectarse y ejecutar comandos
mysql -h "$HOST" -u "$USER" -p"$PASSWORD" <<EOF
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'password';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
EOF