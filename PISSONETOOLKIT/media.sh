#!/bin/bash

declare totale=0
declare numInseriti=0
declare media=0.0
declare n

RED='\033[1;31m' #RED
BLU='\033[1;34m' #BLU
YLW='\033[1;33m' #YELLOW
NOC='\033[0m'	 #NO COLOR
GRE='\033[1;32m' #GREEN
NUMINSERITI=""

function stampaTitolo() {
	
	clear
	printf "Per terminare il programma inserisci ${GRE}x${NOC}\n\n"

	if [[ "$1" == "valid" ]]; then
		printf "Numeri inseriti: ${BLU}$NUMINSERITI${NOC}\n\n"
	else
		printf "${RED}Input invalido${NOC}\n\n"
	fi

}

while :
do
	#Viene letto l'input dell'utente
	read -p "Inserisci un numero: " n
	printf "\n"

	case $n in
		#termina il programma
		'x')
			stampaTitolo "valid"
			media=$(bc <<< "scale=2;$totale/$numInseriti")
			printf "${BLU}$totale${NOC} ${YLW}/${NOC} ${BLU}$numInseriti${NOC} ${YLW}=${NOC} ${GRE}$media${NOC}\n\n"
			break
			;;
		#controlla l'input inserito, visualizza l'errore
		*)
			if ! [[ $n =~ ^[+-]?[0-9]+$ ]]; then
				stampaTitolo "invalid"
			else
				numInseriti=$(( numInseriti+1 ))
				totale=$(( totale + n ))
				NUMINSERITI="$NUMINSERITI $n"
				stampaTitolo "valid"
			fi
			;;
	esac

done
