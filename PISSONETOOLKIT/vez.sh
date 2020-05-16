#!/bin/bash

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

#\033[1mYOUR_STRING\033[0m
# l'1 indica il testo in grassetto
YLW='\033[1;33m' #Yellow
BLU='\033[1;34m' #Blue
RED='\033[0;31m' #RED
HRED='\033[1;31m' #HEAVY RED
NOC='\033[0m'	 #No Color

#printf "Powered by ${YLW}VTEC Security${NOC}\n"
#printf "${BLU}http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html${NOC} è qua che si impara eeeeeee\n\n"

while :
do
clear
printf "Username - $(hostname)\n\n"
printf "${HRED}-------------------------------${NOC}\n"
printf "           ${HRED}MAIN MENU${NOC}\n"
printf "${HRED}-------------------------------${NOC}\n\n"
printf "${BLU}1)${NOC} Display date and time.\n"
printf "${BLU}2)${NOC} Display what users are doing.\n"
printf "${BLU}3)${NOC} Change your hostname.\n"
printf "${BLU}4)${NOC} Exit\n"

read -p "Choose what to do [1|4] " choice

#Viene letto l'input dell'utente e confrontato con i casi possibili presentati anche nel menu
case $choice in
1)
	printf "Today is $(date)"
	printf "\n"
	read -p "Press [Enter] to continue "
	printf "\n"
	readEnterKey
	;;
2)
	w
	printf "\n"
	read -p "Press [Enter] to continue "
	printf "\n"
	readEnterKey
	;;
3)
	printf "\n"
	
	printf "Old hostname: ${HRED}"
	hostname
	printf "${NOC}\n"
	read -p "Type in your new hostname: " newName
	sudo hostname -b $newName
	printf "\n"
	read -p "Press [Enter] to continue "
	readEnterKey
	;;
4)
	printf "Bye!"
	printf "\n"
	exit 0
	;;
*)
	printf "${HRED	}INVALID OPERATION ORCODDUE\n${NOC}"
	read -p "Press [Enter] to continue "
	readEnterKey
	;;

esac
done

