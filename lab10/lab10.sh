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

#Q2
echo -e "${GREEN}Starts or ends with Jose$DEFAULT"
grep -E --color=always '^Jose|Jose$' phonebook.dat

#Q3
echo -e "${GREEN}Contains sequence of at least 27 upper or lower-case alphabetic characters$DEFAULT"
grep -E --color=always '[[:alpha:]]{27}' phonebook.dat

#Q4
echo -e "${GREEN}Sequences of more than 18 characters$DEFAULT"
grep -E --color=always '.{19}' phonebook.dat

#Q5
echo -e "${GREEN}Sequences of exactly 10 characters$DEFAULT"
grep -E --color=always '^.{10}$' phonebook.dat

#Q6
echo -e "${GREEN}Sequences of 6-8 alphabetic characters surrounded by spaces or tabs$DEFAULT"
grep -E --color=always '\s[[:alpha:]]{6,8}\s' phonebook.dat

#Q7
echo -e "${GREEN}Contains local phone number$DEFAULT"
grep -E --color=always '^[0-9]{3}-[0-9]{4}|[^-d][0-9]{3}-[0-9]{4}' phonebook.dat

#Q8
echo -e "${GREEN}Contains valid URL$DEFAULT"
grep -E --color=always '^(http|HTTP)://[a-zA-Z]+\.[a-zA-Z]+\.(com|edu)' phonebook.dat
