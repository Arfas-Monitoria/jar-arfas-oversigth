#! bin/sh

java -version
if [ $? -eq 0 ]
        then
		clear
		echo "Java já instalado"
	else
		sudo add-apt-repository ppa:webupd8team/java -y
		sudo apt update -y
		clear
	
	 if [ $VERSAO -eq 11 ]
	 	then 
			 sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
			 clear
			 echo "O Java foi instalado"
	fi
fi

