PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Olá usuário, serei seu assistente de instalação e configuração da sua máquina :D"
echo  "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Primeir irei fazer uma atualização de pacotes da sua máquina"
sudo apt update && sudo apt upgrade -y
clear
echo  "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Pronto! A sua máquina foi atualizada!"
echo  "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Agora vou verificar se você possui o Java instalado"
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Você já tem o java instalado!!!;"
		if [ -d jar-arfas-oversigth/ ];
			then
				echo "$(tput setaf 10)[Bot assistan Arfast]:$(tput setaf 7) Verificamos aqui que você já tem nosso JAR instalado nesse diretório!"
				echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Vamos atualizar ele pra última versão..."
				cd jar-arfas-oversigth/
				git pull
				clear
				echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) JAR atualizado para última versão com sucesso :D"
			else
				echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Verifiquei aqui que você não tem o nosso JAR instalado :("
				echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Deseja fazer o clone do repositório JAR (S/N)?"
				read inst
				if [ \"$inst\" == \"S\" ]
					then
									echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Clonando o JAR..."
									sleep 4
									git clone https://github.com/Arfas-Monitoria/jar-arfas-oversigth.git
									clear
									echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) O JAR foi clonado com sucesso :D"
									echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Acessado o diretório do JAR..."
									cd jar-arfas-oversigth/
									sleep 4
									echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Abrindo o JAR...;"
									sleep 4
									java -jar Arfas-Oversigth.jar
						else
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Você optou por não fazer o clone do JAR, até a próxima então!"
					fi
		fi

	else
		echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Que ótimo :D Vou realizar a instalação, só um minuto..."
			echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado :D"
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -Y
					clear
					echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Java instalado com sucesso!"
					echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Deseja fazer o clone do repositório JAR (S/N)"
					read inst
				if [ \"$inst\" == \"S\" ]
					then
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Clonando o JAR...;"
						sleep 4
						git clone https://github.com/Arfas-Monitoria/jar-arfas-oversigth.git
						clear
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) O JAR foi clonado com sucesso :D"
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Acessado o diretório do JAR..."
						cd jar-arfas-oversigth/
						sleep 2
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7) Abrindo o JAR...;"
						sleep 2
						java -jar Arfas-Oversigth.jar
						else
						echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Você optou por não fazer o clone do JAR, até a próxima então!"
					fi
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant Arfas]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
	fi
fi



