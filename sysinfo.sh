if [ ! -d "system_info" ]
then
    echo "system_info folder does not exist. Creating system_info."
    mkdir ./system_info
    echo "system_info was created."
else
    echo "system_info already exists."
fi

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
