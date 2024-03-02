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
		echo "$extension"

		i=$((i+1))
		filesize="$(stat -c%s "$file")"
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

declare -i totAvg=$((totalbytes/i))
declare -i imageAvg=$((imagebyte/imageCT))
declare -i docAvg=$((docbyte/docAvg))
declare -i pdfAvg=$((pdfbyte/pdfCT))
declare -i exeAvg=$((exebyte/exeCT))
declare -i dataAvg=$((databyte/dataCT))
declare -i unknownAvg=$((unknownbyte/unknownCT))

echo -e "$i total files were moved   $totalbytes total bytes were moved   average file size overall is $totAvg B"
echo -e "\n$imageCT files were moved into images   $imagebyte bytes were moved into images   average image file size is $imageAvg B"
echo -e "\n$docCT files were moved into documents   $docbyte bytes were moved into documents   average document file size is $docAvg B"
echo -e "\n$pdfCT files were moved into pdfs   $pdfbyte bytes were moved into pdfs   average pdf file size is $pdfAvg B"
echo -e "\n$exeCT files were moved into executables   $exebyte bytes were moved into executables   average executable file size is $exeAvg B"
echo -e "\n$dataCT files were moved into data   $databyte bytes were moved into data   average data file size is $dataAvg B"
echo -e "\n$unknownCT files were moved into unknown   $unknownbyte bytes were moved into unknown   average unknown file size is $unknownAvg B"
