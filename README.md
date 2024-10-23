# Guia de Instalação do Linux em uma Máquina Virtual

## Índice

- Passo 1:**Download da Distribuição Linux**
- Passo 2:**Instalação do VirtualBox**
- Passo 3**Criação e Configurações da Máquina Virtual** 
- Passo 4**Processo da Instalação do Linux**
- Passo 5:**Acessando a Distro**
  

## Pré-requisitos
- Distribuição Linux (no meu caso usei a distro Debian 12), baixe a distro Linux de sua escolha.
- VirtualBox.

### Passo 1 **Download da Distribuição Linux**

- Fiz o download do arquivo ISO da versão Debian 12 no site: [Debian](https://www.debian.org/download)

### Passo 2: **Instalação da VirtualBox**.
- Entrei no site: [VirtualBox](https://www.virtualbox.org)
- Baixe e instale na maquina. 

### Passo 3:**Criação e Configurações da Máquina Virtua**l 

- Abri o VirtualBox e apertei o NEW para poder criar uma máquina virtual.
- Escolhi o nome para minha  maquina e defini quanto de memoria **RAM** seria utilizada. **(utilizei 2GB).**
- Selecionei a opção para criar um novo disco rígido virtual e ajustei o tamanho do disco. **(utiizado 30GB).**
- Após a criação, selecionei a máquina e clique em **Settings**.
- Aba Storage e clique em **Empty**, e adicione o arquivo **ISO** do debian.

### Passo 4:**Processo da Instalação do Linux**

- Cliquei sobre a imagem da sua máquina virtual e pressione **"Start"** para iniciar o sistema.
- O processo de instalação foi iniciado.
- Escolha o idioma.
- Configure o teclado.
- Particionamento de disco: Se o disco possui 30GB. Para o particionamento do disco, aqui está as partições que usei no meu disco)
- /boot: 300MB **( Esta partição armazena os arquivos necessários para inicializar o sistema)
- / (sistema de arquivos raiz): 15GB. **(Onde ficam todos os arquivos e pastas principais do sistema).**
- /home: o restante do espaço disponível.**( Aqui ficam os arquivos pessoais do usuário, como documentos, downloads e configurações).**
- SWAP: 1,9GB **( Esse espaço é utilizado como memória virtual, que o sistema usa quando a memória RAM está cheia).**
- Defina o nome de usuário e a senha que desejar para acessar o sistema.
- Após concluir as configurações iniciais, o sistema iniciará automaticamente a instalação do Debian.
- No final da instalação, a máquina virtual ofereceu a opção de reiniciar. Selecionei "Sim" para completar o processo e iniciar o sistema.

### Passo 5: **Acessando a Distro**
- Ao iniciar a máquina, abri o temrinal. Para entrar com permissões de usuário root, digitei sudo su e pressione Enter.
- O terminal solicitou o nome e a senha que foram cadastrados no início da instalação da distribuição.
- Atualizei o meu sistemas com o comando:
```bash
apt-get update
```

```bash
apt-get upgrade
```
- Optei em instalar uma interface gráfica mais intuitiva e amigável.
- Com terminal aberto no  usuário root e executei o comando de instalação. Optei em instalar a gnome.
  
```bash
apt install gnome
```
- Após a instalação, reinicei a maquina com o comando:

```bash
reboot
```
- A maquina foi reiniciada, e aproveitei a oportunidade para explorar e entender melhor o Linux.
- Esse é o  passo a passo de como eu instalei e configurei o Debian na minha maquina virtual usando o VirtualBox.



# Atividade no Linux

##  Monitorar o Servidor Nginx

### Índice

1. **Subir um servidor Nginx**
   - O servidor Nginx deve estar online e rodando.

2. **Criar um script de validação**
   - O script deve validar se o serviço Nginx está online e enviar o resultado da validação para um diretório definido.

3. **Conteúdo do script**
   - O script deve conter as seguintes informações:
   - Data e Hora
   - Nome do serviço
   - Status
   - Mensagem personalizada (Online/Offline)

4. **Execução automatizada do script**
   - Preparar a execução automatizada do script a cada 5 minutos.

5. **Versionamento da atividade**
   - Realizar o versionamento do código e dos scripts utilizados na atividade.

### 1 .Subir um servidor 
- Instalação do Nginx:

```bash
apt-get install nginx
```
- Checando o status do servidor:

```bash
systemctl status nginx
```
<img src="/img/status_nginx.png">


- Checando se o nginx está rodando: 
```bash
ss -tulne
```
<img src="/img/nginx_rodando.png">


## 2. **Criar um script de validação**
###  Documentação do Script de Validação do Nginx

### Objetivo
Este script tem como objetivo verificar o status do serviço Nginx, registrando se ele está online ou offline, e armazenando as informações em arquivos de log específicos.

### Estrutura do Script

###  Definição de Variáveis

- **datetime**: Captura a data e a hora atuais no formato `YYYY-MM-DD HH:MM:SS`.
- **dir_logs**: Diretório onde os arquivos de log serão armazenados.
- **online_log**: Nome do arquivo de log para registros quando o Nginx está online.
- **offline_log**: Nome do arquivo de log para registros quando o Nginx está offline.

###  Verificação do Status do Nginx

O script verifica se o Nginx está ativo utilizando o comando `systemctl is-active --quiet nginx`. Dependendo do resultado, as seguintes ações são realizadas:

### Se o Nginx estiver Online ou Offline:
- **STATUS**: A variável é definida  como `online`ou òffine`, para cada caso.
- **mensagem**: Uma mensagem personalizada indicando que o Nginx está online ou offline.
- **status_log_file**: O caminho do arquivo de log para registros online e offline.

### Registro no Log:
-  echo "$datetime - nginx - Status: $status - $mensagem" >> "$status_log_file"

### Mensagem de saída no terminal caso ambos os casos de status
-  echo "$datetime - nginx - Status: $STATUS - $mensagem" 

### **Execução automatizada do script**
- Para realizar a execução da automatização dod script a cada 5 minutos.
- No terminal 
```bash
crontab -e
```
- Selecione qual editor de texto irá realizar
- Incluido na última linha o seguinte:
```bash
*/5****/bin/bash/usr/local/sccripts/validar_nginx.sh
```
- Salve e feche o terminal. Isso irá programar a execução do script a cada 5 minutos.


### Resultado das mensagem que irão aparecer quando validar o script - validar_nginx.sh:

<img src="/img/nginx-online.png">

<img src="/img/nginx_offline.png">


### **Versionamento da atividade**
1- Inicialize um repositório Git no diretório do projeto:

```bash
git init
```
2- Adicione os arquivos ao repositório:

```bash
git add validar_nginx.sh
```
3- Faça o commit das alterações:

```bash
git commit -m "Inicialização do projeto"
```

4- Adicionando no repositório remoto:

```bash 
git remote add origin https://github.com/Rebeccaa27/status_nginx
```

5- Dando push das alterações na branch 'main'

```bash
git push origin main

```
