if [ ! -d "images" ]
then
    echo "images folder does not exist. Creating images."
    mkdir ./images
    echo "images was created."
else
    echo "images already exists."
fi


if [ ! -d "documents" ]
then
    echo "documents folder does not exist. Creating documents."
    mkdir ./documents
    echo "documents was created."
else
    echo "documents already exists."
fi

if [ ! -d "pdfs" ]
then
    echo "pdfs folder does not exist. Creating pdfs."
    mkdir ./pdfs
    echo "pdfs was created."
else
    echo "pdfs already exists."
fi

if [ ! -d "executables" ]
then
    echo "executables folder does not exist. Creating executables."
    mkdir ./executables
    echo "executables was created."
else
    echo "executables already exists."
fi


if [ ! -d "data" ]
then
    echo "data folder does not exist. Creating data."
    mkdir ./data
    echo "data was created."
else
    echo "data already exists."
fi


if [ ! -d "unknown" ]
then
    echo "unknown folder does not exist. Creating unknown."
    mkdir ./unknown
    echo "unknown was created."
else
    echo "unknown already exists."
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
