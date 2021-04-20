#! /usr/bin/env bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[1;34m"
ENDCOLOR="\e[0m"

#echo -e "${RED}This is some red text, ${ENDCOLOR}"
#echo -e "${GREEN}And this is some green text${ENDCOLOR}"

echo "${BLUE}Actualizando lista de repositorios${ENDCOLOR}"
sudo apt update

echo "${BLUE}Instalando genie y openshot${ENDCOLOR}"
sudo apt install genie openshot -y
if [ $? ]
then
  echo "${GREEN}Instalacion finalizada con exito${ENDCOLOR}"
else
  echo "${RED}Ha ocurrido un error${ENDCOLOR}"
fi
echo ""
echo ""

echo "${BLUE}Instalando snap store y kompozer${ENDCOLOR}"
sudo apt install snapd -y
sudo snap install core
sudo snap install kompozer
if [ $? ]
then
  echo "${GREEN}Instalacion finalizada con exito${ENDCOLOR}"
else
  echo "${RED}Ha ocurrido un error${ENDCOLOR}"
fi
echo ""
echo ""

echo "Creando fichero .desktop para kompozer"
sudo cp ./aux/kompozer.desktop /usr/share/applications/
echo "kompozer deberia ser accesible desde 'Programacion'"
echo ""
echo ""

echo "Copiando configuracion de Libreoffice base al skel"
sudo mkdir -p /etc/skel/.config/libreoffice/4/user/config/
sudo cp ./aux/javasettings_Linux_X86_64.xml /etc/skel/.config/libreoffice/4/user/config/
echo ""
echo ""

echo "Instalando grub-customizer"
sudo apt install build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev -y
wget https://launchpad.net/grub-customizer/5.1/5.1.0/+download/grub-customizer_5.1.0.tar.gz
tar xzf grub-customizer_5.1.0.org.tar.gz
cd grub-customizer-5.1.0/
cmake . && make -j8
sudo make install
if [ $? ]
then
  echo "${GREEN}Instalacion finalizada con exito${ENDCOLOR}"
else
  echo "${RED}Ha ocurrido un error${ENDCOLOR}"
fi
echo ""
echo ""

echo "Lanzando grub-customizer"
grub-customizer

echo "-----------------------------------"
echo "Fin del script"
echo "-----------------------------------"
