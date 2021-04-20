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


printf "${BLUE}Actualizando lista de repositorios${NORMAL}"
sudo apt update

printf "${BLUE}Instalando genie y openshot${NORMAL}"
sudo apt install genie openshot -y
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n\n"
else
  printf "${RED}Ha ocurrido un error${NORMAL}\n\n"
fi

printf "${BLUE}Instalando snap store y kompozer${NORMAL}"
sudo apt install snapd -y
sudo snap install core
sudo snap install kompozer
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n\n"
else
  printf "${RED}Ha ocurrido un error${ENDCOLOR}\n\n"
fi

printf "${BLUE}Creando fichero .desktop para kompozer${NORMAL}"
sudo cp ./aux/kompozer.desktop /usr/share/applications/
printf "${GREEN}kompozer deberia ser accesible desde 'Programacion'${NORMAL}\n\n"

printf "${BLUE}Copiando configuracion de Libreoffice base al skel${NORMAL}"
sudo mkdir -p /etc/skel/.config/libreoffice/4/user/config/
sudo cp ./aux/javasettings_Linux_X86_64.xml /etc/skel/.config/libreoffice/4/user/config/
printf "${GREEN}OK${NORMAL}\n\n"

printf "${BLUE}Instalando grub-customizer${NORMAL}"
sudo apt install build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev -y
wget https://launchpad.net/grub-customizer/5.1/5.1.0/+download/grub-customizer_5.1.0.tar.gz
tar xzf grub-customizer_5.1.0.tar.gz
cd grub-customizer-5.1.0/
cmake . && make -j8
sudo make install
if [ $? ]
then
  printf "${GREEN}OK${NORMAL}\n\n"
else
  printf "${RED}Ha ocurrido un error${NORMAL}\n\n"
fi

printf "${BLUE}Lanzando grub-customizer${NORMAL}"
grub-customizer

printf "${GREEN}-----------------------------------${NORMAL}"
printf "${GREEN}Fin del script${NORMAL}"
printf "${GREEN}-----------------------------------${NORMAL}"
