#!/bin/bash
#MoulesFrites
#Script de sauvegarde et de recuperation de monde minecraft



function send
{
	timestamp=$(date +%s)
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
	if cd /mnt/c/Users/$user_for_save/AppData/Roaming/.minecraft/saves/$to_save 2> /dev/null
	then
		if cd /mnt/c/Users/$user_for_save/minecraft_saves/Minecraft_save/$to_save 2> /dev/null
		then
			cp -r /mnt/c/Users/$user_for_save/AppData/Roaming/.minecraft/saves/$to_save/ /mnt/c/Users/$user_for_save/minecraft_saves/Minecraft_save/$to_save/
		else
			mkdir /mnt/c/Users/$user_for_save/minecraft_saves/Minecraft_save/$to_save
			cp -r /mnt/c/Users/$user_for_save/AppData/Roaming/.minecraft/saves/$to_save/ /mnt/c/Users    /$user_for_save/minecraft_saves/Minecraft_save/$to_save/
		fi	
	else
		echo 'Inexistant world'
		exit
	fi
	git add /mnt/c/Users/$user_for_save/minecraft_saves/Minecraft_save/$to_save/*
	git commit -m $timestamp
	git push
}

if [ "$1" = "-s" ]
then
	send
else
	echo 'Pas encore code'
fi

