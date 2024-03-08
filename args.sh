#!/bin/bash

echo -e "$0 is the name of the calling program"
echo -e "$# is the number of positional parameters sent to the script"
echo -e "A complete list of all positional parameters sent to the shell script is given below\n$@"



#This is a comment block lmao
#As the kids might say, it's a bit goofy ahhhhh
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
#I did nothing successfully! Hooray!
