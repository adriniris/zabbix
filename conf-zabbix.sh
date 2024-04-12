#!/bin/bash

# Variables de conexión a MySQL
HOST="localhost"
USER="zabbix"
PASSWORD="password"
DATABASE="zabbix"

SERVER_ZABBIX_ARCHIVE="/etc/zabbix/zabbix_server.conf"
SERVER_ZABBIX_NGINX="/etc/zabbix/nginx.conf"

zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -u"$USER" -p"$PASSWORD" "$DATABASE"

# Cambio archivos de configuración

sed -i '/DBPassword=/c\DBPassword=password' "$SERVER_ZABBIX_ARCHIVE"
sed -i '/# listen 8080;/c\listen 8080;' "$SERVER_ZABBIX_NGINX"
