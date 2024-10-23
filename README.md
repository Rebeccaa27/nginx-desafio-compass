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

- Faça o download do arquivo ISO da versão que desejada.

### Passo 2: **Instale a VirtualBox**.
- Entre no site: [VirtualBox](https://www.virtualbox.org)
- Baixe e instale na sua maquina. 

### Passo 3:**Criação e Configurações da Máquina Virtua**l 

- Abra o VirtualBox e aperte o NEW para poder criar uma máquina virtual.
- Escolha um nome para sua maquina e defina quanto de memoria **RAM** será utilizada **(recomendo pelo menos 2GB).**
- Selecione a opção para criar um novo disco rígido virtual e ajuste o tamanho do disco que será utilizado **(recomendo que seja no mínimo 30GB).**
- Após a criação, selecione a máquina e clique em **Settings** ou **Configurações** .
- Vá para a aba Storage, clique em **Empty**, e adicione o arquivo **ISO** da distribuição Linux baixada e salve.

### Passo 4:**Processo da Instalação do Linux**

- Clique sobre a imagem da sua máquina virtual e pressione **"Start"** para iniciar o sistema.
- O processo de instalação será iniciado. Primeiro, escolha o idioma de sua preferência.
- Configure o teclado: Selecione a configuração adequada ao layout do seu teclado.
- Particionamento de disco: Se o disco possui 30GB. Para o particionamento do disco, você pode optar pela opção 'Assistido - usar o disco inteiro' para facilitar o processo. Se preferir fazer o particionamento manual, aqui está as partições que usei no meu disco)**
- /boot: 300MB **( Esta partição armazena os arquivos necessários para inicializar o sistema).
- / (sistema de arquivos raiz): 15GB. **(Onde ficam todos os arquivos e pastas principais do sistema).**
- /home: o restante do espaço disponível.**( Aqui ficam os arquivos pessoais do usuário, como documentos, downloads e configurações).**
- SWAP: 1,9GB **( Esse espaço é utilizado como memória virtual, que o sistema usa quando a memória RAM está cheia).**
- Defina o nome de usuário e a senha que desejar para acessar o sistema.
- Após concluir as configurações iniciais, o sistema iniciará automaticamente a instalação do Debian.
- Quando solicitado, você terá a opção de instalar um ambiente gráfico. Caso esteja configurando um servidor, pode optar por "Sem ambiente de desktop".
- No final da instalação, a máquina virtual oferecerá a opção de reiniciar. Selecione "Sim" para completar o processo e iniciar o sistema.

### Passo 5: **Acessando a Distro**
- Ao iniciar a máquina, o terminal será exibido. Para entrar com permissões de usuário root, digite sudo su e pressione Enter.
- O terminal solicitará a senha que você cadastrou no início da instalação da distribuição.
- Com a máquina iniciada, você tem a oportunidade de explorar o Linux e se familiarizar com seu funcionamento, comandos e recursos.
- Caso queria ter uma experiência mais intuitiva e amigável, considere instalar uma interface gráfica. Isso torna o uso do sistema muito mais fácil e agradável para quem está iniciando.
- Caso queria instalar uma interface, você pode pesquisar sobre as opções disponíveis e escolher a que mais combina com você e vai facilita seu dia a dia.
- Após escolher a interface gráfica que você deseja instalar, basta abrir o terminal como usuário root e executar o comando de instalação. Por exemplo, para instalar o GNOME, você pode usar o seguinte comando:
  
```bash
apt install gnome
```
- Após a instalação, pode ser necessário reiniciar a máquina. Para reinicar a máquina você pode colocar no terminal o seguinte comando e logo após aoertar ENTER:

```bash
reboot
```
- Assim que a máquina reiniciar, você verá a nova interface gráfica. Agora, você pode começar a usar o sistema de forma mais intuitiva e interativa.
### Aproveite a experiência

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
