#!/system/bin/sh
blue='\033[0;34m'
yellow='\033[0;33m'
green='\033[0;92m'
purple='\033[0;95m'
red='\033[0;31m'
nocol='\033[0m'
echo -e "$purple Script Created by Mohamed Zumair <mhdzumair@gmail.com>\n $nocol"
printf "Enter any name to to save backup file in folder: "
read f
if [ -d /sdcard/$f ]
then
	echo -e "$yellow\nfolder already exist\n$nocol"
else
	echo -e "$green \ncreating folder\n$nocol"
	
	mkdir /sdcard/$f
fi
for i in efuse hw oem persist utags nvram secro frp nvdata
do
	if [ -f /sdcard/$f/$i.img ]
	then
		echo -e "$yellow $i is already exist. skipping $i \n $nocol"
	else
		echo -e "$green \ncopying $i partition...\n $nocol"
		dd  if=/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/$i of=/sdcard/$f/$i.img
	fi
done
echo -e "$blue All done!!! \nyou files are saved to $red $f $blue folder in $red Internal Storage. $blue\nThanks use this script. Keep supporting me.\n $nocol"
