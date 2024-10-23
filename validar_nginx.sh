#!/bin/bash

# Definindo data e hora na variável. 

datetime=$(date "+%Y-%m-%d %H:%M:%S")

# Diretório e nomes dos arquivos de log nas variáveis.

dir_logs="/var/log/status_nginx"
online_log="nginx_online.log"
offline_log="nginx_offline.log"


# Verificando se o Nginx está online ou offline.
if systemctl is-active --quiet nginx; then
    STATUS="ONLINE"
    mensagem="O serviço nginx está Online."
    status_log_file="$dir_logs/$online_log"

    # Registrando a mensagem no arquivo do log.
    echo "$datetime - nginx - Status: $status - $mensagem" >> "$status_log_file"

    # Exibindo a mensagem no terminal caso o serviço esteja online
    echo "$datetime - nginx - Status: $status - $mensagem"

else

    STATUS="OFFLINE"
    mensagem="O serviço nginx está Offline."
    status_log_file="$dir_logs/$offline_log"

    # Registro da mensagem no arquivo do loG.
    echo "$datetime - nginx - Status: $STATUS - $mensagem" >> "$status_log_file"

    # Exibindo a mensagem no terminal se o serviço estiver offline.
    echo "$datetime - nginx - Status: $STATUS - $mensagem"
fi

