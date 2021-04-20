#! /usr/bin/env bash

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# printf "%40s\n" "${blue}This text is blue${normal}"


printf "${BLUE}Actualizando lista de repositorios${NORMAL}\n"
sudo apt update
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Instalando geany y openshot${NORMAL}\n"
sudo apt install geany openshot -y
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n"
else
  printf "${RED}Ha ocurrido un error${NORMAL}\n"
fi
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Instalando snap store y kompozer${NORMAL}\n"
sudo apt install snapd -y
sudo snap install core
sudo snap install kompozer
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n"
else
  printf "${RED}Ha ocurrido un error${ENDCOLOR}\n"
fi
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Creando fichero .desktop para kompozer${NORMAL}\n"
sudo cp ./aux/kompozer.desktop /usr/share/applications/
printf "${GREEN}kompozer deberia ser accesible desde 'Programacion'${NORMAL}\n"
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Copiando configuracion de Libreoffice base al skel${NORMAL}\n"
sudo mkdir -p /etc/skel/.config/libreoffice/4/user/config/
sudo cp ./aux/javasettings_Linux_X86_64.xml /etc/skel/.config/libreoffice/4/user/config/
printf "${GREEN}OK${NORMAL}\n"
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Instalando grub-customizer${NORMAL}\n"
sudo apt install build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev -y
wget https://launchpad.net/grub-customizer/5.1/5.1.0/+download/grub-customizer_5.1.0.tar.gz
tar xzf grub-customizer_5.1.0.tar.gz
cd grub-customizer-5.1.0/
cmake . && make -j8
sudo make install
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n"
else
  printf "${RED}Ha ocurrido un error${NORMAL}\n"
fi
printf "${YELLOW}################################################${NORMAL}\n\n"

printf "${BLUE}Lanzando grub-customizer${NORMAL}\n"
grub-customizer
printf "--------------------------------------------------\n\n"

printf "${GREEN}-----------------------------------${NORMAL}\n"
printf "${GREEN}Fin del script${NORMAL}\n"
printf "${GREEN}-----------------------------------${NORMAL}\n"
