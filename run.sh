#!/bin/bash
echo "Instalando genie y openshot"
sudo apt install genie openshot -y
echo "Instalacion finalizada"
echo "\n\n"

echo "Instalando snap store y kompozer"
sudo apt install snapd -y
sudo snap install core
sudo snap install kompozer
echo "Instalacion finalizada"
echo "\n\n"

echo "Creando fichero .desktop para kompozer"
sudo cp ./aux/kompozer.desktop /usr/share/applications/
echo "kompozer deberia ser accesible desde 'Programacion'"
echo "\n\n"

echo "Copiando configuracion de Libreoffice base al skel"
sudo mkdir -p /etc/skel/.config/libreoffice/4/user/config/
sudo cp ./aux/javasettings_Linux_X86_64.xml /etc/skel/.config/libreoffice/4/user/config/
echo "\n\n"



echo "-----------------------------------"
echo "Fin del script"
echo "-----------------------------------"
