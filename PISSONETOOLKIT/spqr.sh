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
RED='\033[1;31m' #RED
PLU='\033[1;35m' #PURPLE
NOC='\033[0m'	 #No Color

#printf "Powered by ${YLW}VTEC Security${NOC}\n"
#printf "${BLU}http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html${NOC} è qua che si impara eeeeeee\n\n"

while :
do
printf "${YLW}Senatus PopulusQue Romanus${NOC} ${RED} SPQR ${NOC}"
wait
done

#printf "${RED}❱${NOC}${YLW}﹝${NOC}${PLU}R O M Ʌ   I N V I C T Ʌ${NOC}${YLW}﹞${NOC}${RED}❰${NOC}\n"

#❰ U+2770
#❱ U+2772
#∆ U+2206
#Ʃ U+01A9
#Ʌ U+0245
#∀ U+2200
#﹞ U+FE5E
#﹝ U+FE5D
