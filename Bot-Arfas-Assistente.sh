#!/bin/bash

PURPLE ='0;35'
NC='\033[0m'
VERSAO=11

#---------------------------------------------------------------------------	
# INICIO

# Inicio do Bot Assistente
echo  "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Olá, tudo bem? Serei seu assistente, e irei te ajudar na instalação do Java em seu computador! :D"

#---------------------------------------------------------------------------
# UPDATE E UPGRADE

# Realizando o update de upgrade
echo  "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Antes de tudo, vamos realizar a atualização dos pacotes do seu computador!"
sudo apt update && sudo apt upgrade -y
clear

#---------------------------------------------------------------------------
# JAVA

# Inicio da verificação do Java
echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Primeiro vou verificar aqui se você já possui o Java instalado, só um minuto..."
sleep 2
java -version

# Se a máquina já tiver o java instalado
if [ $? -eq 0 ]
    then
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Parabéns! Você já possui o Java instalado!"

    # Se não tiver o java instalado na máquina
    else
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Oh não! Você não possui o Java instalado :( Mas calma, eu posso resolver isso para você!"

        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Vou realizar a instalação, só um minuto..."

        sleep 2
        sudo add-apt-repository ppa:webupd8team/java
        -y 
        clear
        sleep 2
        sudo apt update -y 
        clear

        # Instalando o Java 
        if [ $VERSAO -eq 11 ]
            then
                echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Estou preparando a instalação da versão 11 do Java."

                sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y

                clear
                        
                echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Seu Java foi instalado com sucesso :D"
        fi
fi

#---------------------------------------------------------------------------
# DOCKER

# Instalação do Docker
echo  "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Agora vou verificar se você possui o Docker instalado..."
sleep 2
docker -version

# Se já possui o Docker instalado
if [ $? -eq 0 ]
    then
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Parabéns! Você já possui o Docker instalado!"

    # Se não tiver o docker instalado na máquina
    else
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Oh não! Você não possui o Docker instalado :( Mas calma, eu posso resolver isso para você!"

        sleep 2
        sudo apt install docker -y
        sudo apt install docker.io -y
        sleep 2

        # Atualizando os pacotes novamente
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Vamos atualizar os pacotes da sua máquina novamente"
        sudo apt update && sudo apt upgrade -y
        clear
fi 

# Realizando algumas configurações do Docker
echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Agora vou realizar algumas configurações do seu Docker..."

sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker

echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Configurações realiazadas com sucesso :D"

#---------------------------------------------------------------------------
# JAR

# Verificando a aplicação
echo "$(tput setaf 10)[Bot assistan Arfast]:$(tput setaf 7) Vou verificar se você já possui a nossa aplicação instalada..."

if [ -d jar-arfas-oversigth/ ]
    then
        echo "$(tput setaf 10)[Bot assistan Arfast]:$(tput setaf 7) Quem bom! Você já possui a nossa aplicação :D"

        echo "$(tput setaf 10)[Bot assistan Arfast]:$(tput setaf 7) Vou realizar a atualização para a última versão..."

        cd jar-arfas-oversigth/
		git pull
		clear

        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Aplicação atualizada para última versão com sucesso :D"

    else
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Oh não! Você não possui a nossa aplicação instalada :( Mas calma, eu posso resolver isso para você!"
		
        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Vou realizar a instalação, só um minuto..."

        sleep 4
		git clone https://github.com/Arfas-Monitoria/jar-arfas-oversigth.git
		clear

        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) A aplicação foi instalada com sucesso :D"

        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Acessado o diretório da aplicação..."

        cd jar-arfas-oversigth/
		sleep 4

        echo "$(tput setaf 10)[Bot-Arfas-Assistente]:$(tput setaf 7) Abrindo a aplicação..."

        sleep 4
		java -jar Arfas-Oversigth.jar
fi 

#---------------------------------------------------------------------------

# ===================================================================
# Projeto desenvolvido por alunos da Faculdade SPTECH.
# Todos direitos reservados para Arfar Monitoria.
# Sob licença Creative Commons @2022
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================