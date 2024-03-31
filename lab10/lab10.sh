#!/bin/bash

echo "$(find ~ -type f -name phonebook.dat)"
cd ~

if [ ! -e phonebook.dat ]; then

   echo -e "phonebook.dat cannot be found.\nExiting script."
   exit 1

fi

echo -e "${GREEN}Found phonebook.dat. ${DEFAULT}Proceeding with script."

GREEN='\033[0;32m'
DEFAULT='\033[0m'

#Q1
echo -e "${GREEN}Starts or ends with Jose$DEFAULT"
grep -E '^Jose|Jose$' phonebook.dat

#Q2
echo -e "${GREEN}Contains sequence of at least 27 upper or lower-case alphabetic characters$DEFAULT"
grep -E '[[:alpha:]]{27}' phonebook.dat

#Q3
echo -e "${GREEN}Sequences of more than 18 characters$DEFAULT"
grep -E '.{19}' phonebook.dat

#Q4
echo -e "${GREEN}Sequences of exactly 10 characters$DEFAULT"
grep -E '^.{10}$' phonebook.dat
