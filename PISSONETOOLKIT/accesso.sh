#!/bin/bash

RED='\033[1;31m' #RED
GRE='\033[1;32m' #GREEN
NOC='\033[0m'	 #NO COLOR

echo
echo

#fai inserire la password
read -s -p "Enter your password: " myPassword

#vai a capo
echo

#controllo della password se è uguale a "tyty"
if test "$myPassword" == "tyty"
then
	printf "\n\n${GRE}Identity Verified${NOC}\n"
	printf "Starting the program now.\n\n"
	./segreto.sh
fi

#controllo della password in caso non sia uguale a "tyty"
if test "$myPassword" != "tyty"
then
	printf "\n\n${RED}Incorrect password${NOC}\n"
	printf "Exiting the program now.\n\n"
fi
