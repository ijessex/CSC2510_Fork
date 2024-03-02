#!/bin/bash

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

declare -i i=0
declare -i totalbytes=0

declare -i imageCT=0
declare -i docCT=0
declare -i pdfCT=0
declare -i exeCT=0
declare -i dataCT=0
declare -i unknownCT=0

declare -i imagebyte=0
declare -i docbyte=0
declare -i pdfbyte=0
declare -i exebyte=0
declare -i databyte=0
declare -i unknownbyte=0

for file in *; do
	extension="${file##*.}"

	if [ -f "$file" ]; then
		echo $extension

		i=$((i+1))
		filesize="$(stat -c%s $file)"
		totalbytes=$((totalbytes+filesize))

		if [ "$extension" = "jpg" ] || [ "$extension" = "jpeg" ] || [ "$extension" = "png" ] || [ "$extension" = "gif" ]; then
			mv "$file" images
			imageCT=$((imageCT+1))
			imagebyte=$((imagebyte+filesize))

		elif [ "$extension" = "txt" ] || [ "$extension" = "docx" ] || [ "$extension" = "doc" ] || [ "$extension" = "pages" ]  || [ "$extension" = "key" ] || [ "$extension" = "pptx" ] || [ "$extension" = "ppt" ] || [ "$extension" = "odt" ] || [ "$extension" = "md" ]; then
			mv "$file" documents
			docCT=$((docCT+1))
			docbyte=$((docbyte+filesize))

		elif [ "$extension" = "pdf" ]; then
			mv "$file" pdfs
			pdfCT=$((pdfCT+1))
			pdfbyte=$((pdfbyte+filesize))

		elif [ "$extension" = "sh" ] || [ "$extension" = "exe" ]; then
			mv "$file" executables
			exeCT=$((exeCT+1))
			exebyte=$((exebyte+filesize))

		elif [ "$extension" = "csv" ] || [ "$extension" = "xlsx" ] || [ "$extension" = "json" ]; then
			mv "$file" data
			dataCT=$((dataCT+1))
			databyte=$((databyte+filesize))

		else
			mv "$file" unknown
			unknownCT=$((unknownCT+1))
			unknownbyte=$((unknownbyte+filesize))

		fi
	fi
done

echo -e "$i files were moved   $totalbytes total bytes were moved"

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

