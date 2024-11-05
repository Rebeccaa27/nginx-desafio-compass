#!/bin/bash

# Definindo data e hora na variável. 

datetime=$(date "+%Y-%m-%d %H:%M:%S")

#Serviço, diretório e nomes dos arquivos de log nas variáveis.

servico="nginx"
dir_logs="/var/log/status_nginx"
online_log="nginx_online.log"
offline_log="nginx_offline.log"

#Cores para online e offline
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# Verificando se o Nginx está online ou offline.
if systemctl is-active --quiet $servico; then
    STATUS="${GREEN}ONLINE${RESET}"
    mensagem="O serviço está ativo."
    status_log="$dir_logs/$online_log"

    # Registrando a mensagem no arquivo do log.
    echo -e "$datetime - $servico - Status: $STATUS - $mensagem" >> "$status_log"


    # Exibindo a mensagem no terminal caso o serviço esteja online
    echo -e "$datetime - $servico - Status: $STATUS - $mensagem"

else

    STATUS="${RED}OFFLINE${RESET}"
    mensagem="O serviço está inativo, verifique se o Nginx foi interrompido."
    status_log="$dir_logs/$offline_log"

    # Registro da mensagem no arquivo do loG.
    echo -e "$datetime - $servico - Status: $STATUS - $mensagem" >> "$status_log"

    # Exibindo a mensagem no terminal se o serviço estiver offline.
    echo -e "$datetime - $servico - Status: $STATUS - $mensagem"
fi
