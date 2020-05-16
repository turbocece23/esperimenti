#!/bin/bash

RED='\033[1;31m' #RED
GRE='\033[1;32m' #GREEN
NOC='\033[0m'	 #NO COLOR

# per pulire la ram

printf "${RED}Prima della pulitura${NOC}"
free -m
echo "# echo 3 > /proc/sys/vm/drop_caches"
printf "${GRE}Dopo la pulitura${NOC}"
free -m

