#!/bin/bash
#echo "+==============================================================================+"
#echo "|   Infos système pour distributions Linux basées sur Debian, Arch ou Fedora   |"
#echo "|                                  infosys.sh                                  |"
#echo "|                                     [211]                                    |"
#echo "|                 © 2019-2024 iDépanne – L'expert informatique                 |"
#echo "|                         idepanne.support.tech@free.fr                        |"
#echo "+==============================================================================+"
#echo ""
#echo ""
cd || return

###### Définition des variables ######
varsys=$(< /etc/os-release)
var55=$(fastfetch --version)
######################################

if [[ $varsys == *"arch"* || $varsys == *"manjaro"* || $varsys == *"endeavouros"* ]]; then
	echo ""
	echo "Distribution mère : Arch Linux"
	echo ""
	echo $var55
	echo ""
	sudo pacman -S --needed --noconfirm fastfetch inxi inetutils ; sudo pacman -Rsn --noconfirm neofetch ; sudo rm -rv ~/.config/neofetch
else
	if [[ $varsys == *"fedora"* ]]; then
		echo ""
		echo "Distribution mère : Fedora Linux"
		echo ""
		echo $var55
		echo ""
		sudo dnf install inxi fastfetch && sudo dnf remove neofetch ; sudo rm -rv ~/.config/neofetch
	else
		if [[ $varsys == *"Debian"* || $varsys == *"debian"* ]]; then
			echo ""
			echo "Distribution mère : Debian Linux"
			echo ""
			echo $var55
			echo ""
			sudo apt-get update ; sudo apt-get install -y inxi smartmontools ; sudo apt-get purge -y neofetch ; sudo rm -rv ~/.config/neofetch
			var0=$(< /proc/cpuinfo grep Model)
			if [[ $var0 == *"Raspberry"* || $var0 == *"raspberry"* ]]; then
				if [[ "$var55" =~ "fastfetch 2.14.0 (aarch64)" ]]; then
					echo ""
					echo "Fastfetch est à jour"
				else
					echo ""
					echo "cd || return && wget -O - https://github.com/fastfetch-cli/fastfetch/releases/download/2.14.0/fastfetch-linux-aarch64.deb > fastfetch-linux-aarch64.deb && sudo dpkg -i fastfetch-linux-aarch64.deb ; sudo rm -rv fastfetch-linux-aarch64.deb"
					cd || return && wget -O - https://github.com/fastfetch-cli/fastfetch/releases/download/2.14.0/fastfetch-linux-aarch64.deb > fastfetch-linux-aarch64.deb && sudo dpkg -i fastfetch-linux-aarch64.deb ; sudo rm -rv fastfetch-linux-aarch64.deb
				fi
			else
				if [[ "$var55" =~ "fastfetch 2.14.0 (x86_64)" ]]; then
					echo ""
					echo "Fastfetch est à jour"
				else
					echo ""
					echo "cd || return && wget -O - https://github.com/fastfetch-cli/fastfetch/releases/download/2.14.0/fastfetch-linux-amd64.deb > fastfetch-linux-amd64.deb && sudo dpkg -i fastfetch-linux-amd64.deb ; sudo rm -rv fastfetch-linux-amd64.deb"
					cd || return && wget -O - https://github.com/fastfetch-cli/fastfetch/releases/download/2.14.0/fastfetch-linux-amd64.deb > fastfetch-linux-amd64.deb && sudo dpkg -i fastfetch-linux-amd64.deb ; sudo rm -rv fastfetch-linux-amd64.deb
				fi
			fi		
		fi
	fi
fi
echo ""
var0=$(< /proc/cpuinfo grep Model)
if [[ $var0 == *"Raspberry Pi"* ]]; then
	wget -O - https://raw.githubusercontent.com/idepanne/infosys/master/apps/infosys-rpi.sh > infosys-rpi.sh > infosys-rpi.sh
	sudo chmod +x infosys-rpi.sh
	./infosys-rpi.sh
	echo ""
	sudo inxi -FfZzxxxraG --display
	echo ""
	echo ""
	echo ""
	fastfetch -c all.jsonc
else
	sudo inxi -FfZzxxxraG --display
	echo ""
	echo ""
	echo ""
	fastfetch -c all.jsonc
fi
cd || return
sudo rm infosys.sh