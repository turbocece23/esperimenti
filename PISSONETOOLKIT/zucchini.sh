#!/bin/bash

HRED='\033[1;31m' #Heavy Red
BLU='\033[1;34m' #Blue
GRE='\033[1;32m' #Green
NOC='\033[0m' #No Color
BLACK='\033[0;30m' #Nero

clear
echo
echo
printf "         😂😂😂 WHO DID THIS LMAO 😂😂😂\n\n"
printf "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\n"
printf "🔥				              🔥\n"
printf "🔥	 👌👌👌 either you ${BLU}¥∑∑T${NOC} 👌👌👌        🔥\n"
printf "🔥					      🔥\n"
printf "🔥	  👎👎👎 or get ${HRED}¥EETEÑ${NOC} 👎👎👎         🔥\n"
printf "🔥					      🔥\n"
printf "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\n\n"
printf "      🥒🥒🥒 ${GRE}MADE BY MISTER ZUCCHINI${NOC} 🥒🥒🥒\n\n\n"
printf "${BLACK}CTRL + C per interrompere il programma${NOC}\n"

n=1

while :
do
	#quello che fa casino è questo printf
	printf "\a"
	
	#incremento di n
	n=$(( n+1 ))
	
	#se n=1000 riportalo a 1
	if test $n = 1000
	then
		n=1
	fi
done
