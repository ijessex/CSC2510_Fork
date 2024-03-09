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
		var=$((${#LINE}-1))
		printf -v line '%.*s' $var "$LINE"
		#I know the code above looks weird, but I am truncating $LINE because there is something at the end of the string that makes it unequal to $UNAME when the two should be equal. I suspect the mystery character is a newline character of some variety, but for the life of me, I cannot figure out what it is. I have worked on this for the past 3 hours, and this is the solution I am using.

		I=$(($I + 1))
		if [[ "$line" == "$UNAME" ]]; then
			echo -e "Found "$UNAME" on line "$I"."
		fi
	done < "$(find -name "$FILE")"

