#!/usr/bin/env bash

if [[ -e phoneinfo.txt ]]; then
rm -rf phoneinfo.txt
fi
echo "
▐█▀█░▐█░▐█▒▐█▀▀█▌▒██▄░▒█▌░▐█▀▀     ░▐█▀█░▐█░▐█░▐█▀▀░▐█▀█▒▐█▒▐▀░▐█▀▀▒▐█▀▀▄
▐█▄█░▐████▒▐█▄▒█▌▒▐█▒█▒█░░▐█▀▀     ░▐█──░▐████░▐█▀▀░▐█──▒▐██▌░░▐█▀▀▒▐█▒▐█
▐█░░░▐█░▐█▒▐██▄█▌▒██░▒██▌░▐█▄▄     ░▐█▄█░▐█░▐█░▐█▄▄░▐█▄█▒▐█▒▐▄░▐█▄▄▒▐█▀▄▄

Author:Satanin2020
For all questions:vk.com/maninmiddle
Telegram:@maninmiddle

"
read -p $'\e[31m[-] Telephone (Example: +79581119509): \e[0m' phone

getphone=$(curl -s "apilayer.net/api/validate?access_key=0480021109f5521f694d6cc1ffbf4d27&number='$phone'&country_code=&format=1" -L > phoneinfo.txt)

valid=$(grep -o 'valid\":true' phoneinfo.txt )
if [[ $valid == *'valid":true'* ]]; then


country=$(grep 'country_name\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
location=$(grep 'location\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
carrier=$(grep 'carrier\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
line_type=$(grep 'line_type\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
IFS=$'\n'
printf "\e[1;92m[*] Country:\e[0m\e[1;77m %s\e[0m\n" $country
printf "\e[1;92m[*] Location:\e[0m\e[1;77m %s\e[0m\n" $location
printf "\e[1;92m[*] Carrier:\e[0m\e[1;77m %s\e[0m\n" $carrier
printf "\e[1;92m[*] Line Type:\e[0m\e[1;77m %s\e[0m\n" $line_type

else
printf "\e[1;93m[!] Request invalid!\e[0m\n"
fi


