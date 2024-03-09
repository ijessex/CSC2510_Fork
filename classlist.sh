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
found=0

while IFS= read -r LINE
	do
		var=$((${#LINE}-1))
		printf -v line '%.*s' $var "$LINE"
		#I know the code above looks weird, but I am truncating $LINE because there is something at the end of the string that makes it unequal to $UNAME when the two should be equal. I suspect the mystery character is a newline character of some variety, but for the life of me, I cannot figure out what it is. I have worked on this for the past 3 hours, and this is the solution I am using.

		I=$(($I + 1))
		if [[ "$line" == "$UNAME" ]]; then
			echo -e "Found "$UNAME" on line "$I"."
			found=1
		fi

	done < "$(find -name "$FILE")"

if [ $found = 0 ]; then
	echo -e "You're username was not found in "$FILE".\n"
	input=''
	end=0
		while [ $end -eq 0 ]
		do
			read -p "Would you like add your username to "$FILE"?    " input

				if [[ "$input" == "Y" ]] || [[ "$input" == "y" ]] || [[ "$input" == "Yes" ]] || [[ "$input" == "yes" ]]; then
					while [ $end -eq 0 ]
					do
						read -p "Would you also like the list to be alphabetized after your username is added?    " input

						if [[ "$input" == "Y" ]] || [[ "$input" == "y" ]] || [[ "$input" == "Yes" ]] || [[ "$input" == "yes" ]]; then
						end=1
						#We sort once prior to appending because if there is not a newline at the end of the file, the sorting process will not work properly. By sorting beforehand, we ensure there is always a new line at the end of the file.
						sort -o "$(find -name "$FILE")" "$(find -name "$FILE")"
						echo -e $UNAME >> "$(find -name "$FILE")"
						sort -o "$(find -name "$FILE")" "$(find -name "$FILE")"
						echo $UNAME" was added to "$FILE" and "$FILE" was alphabetized."

						elif [[ "$input" == "N" ]] || [[ "$input" == "n" ]] || [[ "$input" == "No" ]] || [[ "$input" == "no" ]]; then
						end=1
						#We sort once here for the same reason as above.
						sort -o "$(find -name "$FILE")" "$(find -name "$FILE")"
						echo $UNAME >> "$(find -name "$FILE")"
						echo $UNAME" was added to "$FILE

						else
						echo "Please, enter Y, y, Yes, or yes to respond with \"yes\""
						echo "Or enter N, n, No, or no to respond with \"no\""
						fi

					done

				elif [[ "$input" == "N" ]] || [[ "$input" == "n" ]] || [[ "$input" == "No" ]] || [[ "$input" == "no" ]]; then
				echo "Okay then. Ending script."
				end=1

				else
				echo "Please, enter Y, y, Yes, or yes to respond with \"yes\""
				echo "Or enter N, n, No, or no to respond with \"no\""
				fi
		done
	fi
