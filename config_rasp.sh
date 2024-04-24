#//////// Activation of SSH and FTP ////////
sudo raspi-config nonint do_ssh 0
sudo apt install vsftpd -y
#////////////////////////////////////////////////

#//////// Download ////////
sudo apt install python3 -y
sudo apt install python3-pip -y
python3 -m venv .venv
. .venv/bin/activate
sudo pip install bluepy
sudo pip install peewee
sudo apt install mariadb-server
sudo pip install pymysql
#////////////////////////////////////////////////

#//////// Creat DB SQL ////////
sudo mysql -uroot -e "CREATE DATABASE msql;"
sudo mysql -uroot -e "CREATE USER 'pi'@'localhost' IDENTIFIED BY 'raspberry';"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON msql.* TO 'pi'@'localhost';"
sudo mysql -uroot -e "FLUSH PRIVILEGES;"
#////////////////////////////////////////////////

sudo python3 meteo.py

#//////// Flask ////////
mkdir myproject
cd myproject
pip install Flask
#////////////////////////////////////////////////
