FROM ubuntu:latest
RUN apt update && apt upgrade
RUN apt install vim wget
RUN wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
RUN dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb

# Actualizamos para recoger el repo de Zabbix
RUN apt update

# Instalamos los paquetes nginx, mysql y los de zabbix, que instala el PHP
RUN apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent

# Copiamos el script de configuración de MariaDB, Zabbix y el entrypoint
COPY conf-zabbix.sh /usr/local/bin/conf-zabbix.sh
COPY conf-mysql.sh /usr/local/bin/conf-mysql.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Le damos permisos de ejecución
RUN chmod +x /usr/local/bin/conf-mysql.sh
RUN chmod +x /usr/local/bin/conf-zabbix.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ejecutamos los scripts de configuración de mysql y de zabbix
RUN /usr/local/bin/conf-mysql.sh
RUN /usr/local/bin/conf-zabbix.sh

# Mandamos al entrypoint y al bucle
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
