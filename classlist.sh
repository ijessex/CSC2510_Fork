#!/bin/bash


if [ "$#" != 2 ]; then
echo -e "Please, enter two arguments. The first should a file name. The second should be username with only alphabetic characters and no whitespace."
echo -e "The formatting will apear like this: ./classlist.sh \"file name.extension\" username"
echo -e "Please, ensure that the file name is enclosed in double quotes."
exit 1
fi

echo -e "\nfilename: $1    username: $2"
echo -e "Searching for $1."
file="$1"

if [ ! "$(find -name "$file")" ]; then
echo -e $file" could not be found. Please, check that the file name is enclosed in double quotes"
exit 1
fi


echo -e "\nSuccess"
echo -e "\nFound "$file" at $(find -name "$file")"




: << 'EOF'
if [ ! -d "unknown" ]
then
    echo "unknown folder does not exist. Creating unknown."
    mkdir ./unknown
    echo "unknown was created."
else
    echo "unknown already exists."
fi

for file in *; do
	#if[[]]; then
		echo $file;
	#fi
done

echo -e "System information has been gathered.  Here’s the summary:" > system_info/system_info.txt
echo -e "\nDate and Time: $(date +%m/%d/%Y\ %T\ %Z)" >> system_info/system_info.txt
echo -e "\nCurrent Shell User: $USER" >> system_info/system_info.txt
echo -e "\nRoot User: $(whoami)" >> system_info/system_info.txt
echo -e "\nCurrent Working Directory: $(pwd)" >> system_info/system_info.txt
echo -e "\nSystem Usage:" >> system_info/system_info.txt
echo -e "$(top -b -n1 -d5 | head -n5)" >> system_info/system_info.txt
echo -e "\nDisk Usage:" >> system_info/system_info.txt
echo -e "$(df -BK -H)" >> system_info/system_info.txt

echo -e "Successfully gathered system infomation. Printing info from system_info.txt.\n"
cat system_info/system_info.txt
EOF
