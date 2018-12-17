#!/bin/bash
#MoulesFrites
#Script de sauvegarde et de recuperation de monde minecraft



function send()
{
	echo 'User ?'
	read a
	user_for_save=$a
	if cd /mnt/c/Users/$user_for_save 2> /dev/null
	then
		cd /mnt/c/Users/$user_for_save
	else
		echo 'Inexistant user'
		exit
	fi
	echo -e 'What world ?\n'$(ls ./AppData/Roaming/.minecraft/saves)
	read a
	to_save=$a
	if cd ./AppData/Roaming/.minecraft/saves/$to_save 2> /dev/null
	then
		cp ./AppData/Roaming/.minecraft/saves/$to_save ./minecraft_save/$to_save	
	else
		echo 'Inexistant world'
		exit
	fi
	git add ./minecraft_save/$to_save
	git commit -m #ajouter timestemp
	git push
}

if [ $1 = "-s" ]
then
	echo 'test'
else
	echo 'Pas encore code'
fi

