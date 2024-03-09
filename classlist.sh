#!/bin/bash


if [ "$#" != 2 ]; then
echo -e "Please, enter two arguments. The first should a file name. The second should be username with only alphabetic characters and no whitespace."
echo -e "The formatting will apear like this: ./classlist.sh \"file name.extension\" username"
echo -e "Please, ensure that the file name is enclosed in double quotes."
exit 1
fi

echo -e "\nfilename: $1    username: $2"
echo -e "Searching for $1."
FILE="$1"
UNAME="$2"

if [ ! "$(find -name "$FILE")" ]; then
echo -e $FILE" could not be found. Please, check that the file name is enclosed in double quotes"
exit 1
fi

echo -e "\nSuccess"
echo -e "\nFound "$FILE" at $(find -name "$FILE")"
echo -e "Checking "$FILE" to see if "$UNAME" already exists in file."

I=0
while IFS= read -r LINE
	do
		((I= I + 1))
		if [ "$UNAME" == "$LINE" ]; then
			echo -e "Found "$UNAME" on line "$I"."
		fi
	done < "$(find -name "$FILE")"

