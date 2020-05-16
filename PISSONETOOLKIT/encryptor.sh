#!/bin/bash

YLW='\033[1;33m' #Yellow
RED='\033[0;31m' #RED
PLU='\033[1;35m' #PURPLE
NOC='\033[0m'	 #No Color

clear
printf "Inserisci una parola o una stringa da codificare:\n"
read input

validAlphaNum()
{
	# Validate arg: returns 0 if all upper+lower+digits; 1 otherwise
	# Remove all unacceptable chars.
	validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

	if [ "$validchars" = "$1" ] ; then
		return 0
	else
		return 1
	fi
}

# Input validation
if ! validAlphaNum "$input" ; then
	echo "Please enter only letters and numbers." >&2
	exit 1
else
	echo "Input is valid."
fi

exit 0
