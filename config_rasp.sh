#//////// Os update ////////
sudo apt update -y
sudo apt upgrade -y
#////////////////////////////////////////////////

#//////// Activation of SSH and FTP ////////
sudo raspi-config nonint do_ssh 0
sudo apt-get install vsftpd -y
#////////////////////////////////////////////////

#//////// Download ////////
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo pip install bluepy
sudo pip install peewee
sudo apt install mariadb-server
sudo pip install pymysql
#////////////////////////////////////////////////

sudo python3 meteo.py
