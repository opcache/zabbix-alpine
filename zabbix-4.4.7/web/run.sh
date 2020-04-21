
docker run --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="127.0.0.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -v /etc/localtime:/etc/localtime:ro \
      --net=host \
      -d zabbix:ser1


docker run --name zabbix-web-nginx-mysql2 -t \
      -e DB_SERVER_HOST="127.0.0.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -e ZBX_SERVER_HOST="127.0.0.1" \
      -e PHP_TZ="Asia/Shanghai" \
      -e ZBX_TYPE="frontend" \
      -e ZBX_OPT_TYPE="nginx" \
      --net=host \
      -d zabbix:web3
