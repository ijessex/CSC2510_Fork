#!bin/bash

if [ ! find ~ -type f -name phonebook.dat ]; then

   echo -e "phonebook.dat cannot be found.\nExiting script."
   exit 1;

fi
