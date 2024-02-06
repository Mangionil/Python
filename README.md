#//////// Os update ////////
sudo apt update
sudo apt upgrade
#////////////////////////////////////////////////

#//////// Activation of SSH and FTP ////////
sudo raspi-config nonint do_ssh 0
sudo apt-get install -y vsftpd
#////////////////////////////////////////////////

#//////// Python download ////////
sudo apt install python3
sudo apt install python3-pip
#////////////////////////////////////////////////

#//////// Python file download ////////
wget https://raw.githubusercontent.com/Mangionil/Python/12139661e6697e0f069cf5cd89e4b1bec635a398/README.md
Ciat README.md
mv README.md meteo.py
sudo pip install bluepy
#////////////////////////////////////////////////

#//////// Apache/MariaDB/PHP download ////////
sudo apt install apache2
sudo apt install mariadb-server
sudo apt install php libapache2-mod-php
sudo service apache2 restart
sudo apt install phpmyadmin
#////////////////////////////////////////////////
