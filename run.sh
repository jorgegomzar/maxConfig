#!/bin/bash

echo "Actualizando lista de repositorios"
sudo apt update

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

echo "Instalando grub-customizer"
sudo apt install build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev
wget https://launchpad.net/grub-customizer/5.1/5.1.0/+download/grub-customizer_5.1.0.tar.gz
tar xzf grub-customizer_5.1.0.org.tar.gz
cd grub-customizer-5.1.0/
cmake . && make -j8
sudo make install
echo "Instalado con exito"
echo "\n\n"

echo "Lanzando grub-customizer"
grub-customizer

echo "-----------------------------------"
echo "Fin del script"
echo "-----------------------------------"
