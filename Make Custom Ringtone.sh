#!/bin/bash
# This script will help you make a custom ringtone for Cisco phones.
# sox $inputfile -t raw -r 8000 -e mu-law -c 1 $outname.raw

echo -e "Welcome to the Cisco Ringtone maker. The file you want to convert must be a WAV file and under 15 seconds."
echo -e "\n\nWhere is your input file at?\n\nA. Local file\nB. On a web server\n\nType an option..."
read opt
if [ "$opt" == "A" ]; then
    echo -e "You have selected Local file. Enter the file path. If it's in the same directory you're in, just type the filename."
    read inputfile
    echo -e "Type the name of the ringtone file."
    read outname
    sox $inputfile -t raw -r 8000 -e mu-law -c 1 $outname.raw
    echo -e "Your ringtone file has been saved to $outname.raw"
    exit
elif [ "$opt" == "B" ]; then
    echo -e "You have selected Web server. Type the full address of the file name. Example: https://hatto.dev/res/sound.wav"
    read weburl
    wget -q $weburl
    echo -e "Type the name of the ringtone file."
    read outname
    sox ${weburl##*/} -t raw -r 8000 -e mu-law -c 1 $outname.raw
    echo -e "Your ringtone file has been saved to $outname.raw"
    exit
else
    echo "Invalid option, please run the script again"
    exit
fi


