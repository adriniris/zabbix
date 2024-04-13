#!/bin/bash

#Arranque de servicios
#Array de servicios
servicios=("zabbix-server" "zabbix-agent" "nginx" "php8.1-fpm")

for servicio in "${servicios[@]}"; do
    echo "Iniciando $servicio..."
    service $servicio start
done

echo "Todos los servicios han sido iniciados"

# Bucle para mantener el contenedor abierto
while true; do sleep 60; done