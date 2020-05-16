#!/bin/bash

declare -i totale=0
declare -i numInseriti=0
declare camadimma=0.0
declare -i n

RED='\033[1;31m' #RED
BLU='\033[1;34m' #BLU
YLW='\033[1;33m' #YELLOW
NOC='\033[0m'	 #NO COLOR
GRE='\033[1;32m' #GREEN
NUMINSERITI=""

while :
do
clear
printf "Per smettere di inserire numeri inserisci lo ${GRE}0${NOC}\n\n"
if test numInseriti!=0
then
	NUMINSERITI="$NUMINSERITI $n"
	printf "Numeri inseriti: ${BLU}$NUMINSERITI${NOC}\n"
	printf "Ultimo numero inserito: ${RED}$n${NOC}\n"
fi
#Viene letto l'input dell'utente e confrontato con i casi possibili presentati anche nel menu
read -p "Inserisci un numero: " n
printf "\n"
case $n in
0)
	printf "${YLW}--${NOC} Somma dei numeri inseriti: ${YLW}$totale${NOC}\n"
	printf "${YLW}--${NOC} Numero di numeri inseriti: ${YLW}$numInseriti${NOC}\n"
	camadimma=$(( totale / numInseriti ))
	printf "${YLW}--${NOC} Media dei numeri inseriti: ${YLW}$camadimma${NOC}\n"
	break
	;;
*)
	numInseriti=$numInseriti+1
	totale=$(( totale + n ))	
	;;
esac

done
