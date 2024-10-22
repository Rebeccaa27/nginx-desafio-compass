#!/bin/bash

SERVICE="nginx"
DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")

if systemctl is-active --quiet $SERVICE; then
    STATUS="Online"
    MENSAGEM="O serviço $SERVICE está Online."
    SAIDA="/var/log/status_nginx/nginx_online.log"
else
    STATUS="Offline"
    MENSAGEM="O serviço $SERVICE está Offline."
    SAIDA="/var/log/status_nginx/nginx_offline.log"
fi


echo "$SERVICE - $DATA_HORA - Status: $STATUS - $MENSAGEM" 



