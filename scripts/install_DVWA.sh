#!/bin/bash

# Step 1: Navigate to /var/www/html and clone DVWA
cd /var/www/html || exit
sudo git clone https://github.com/ethicalhack3r/DVWA

# Step 2: Set permissions for DVWA folder
sudo chmod -R 777 DVWA

# Step 3: Copy and configure the config file
cd DVWA/config || exit
sudo cp config.inc.php.dist config.inc.php

# Optional: Customize the DB user and password
sudo sed -i "s/'root'/'userDVWA'/" config.inc.php
sudo sed -i "s/''/'dvwa'/" config.inc.php

# Step 4: Start MySQL and configure the database
sudo systemctl start mysql
sudo mysql -u root -e "CREATE DATABASE dvwa;"
sudo mysql -u root -e "CREATE USER 'userDVWA'@'127.0.0.1' IDENTIFIED BY 'dvwa';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON dvwa.* TO 'userDVWA'@'127.0.0.1';"

# Step 5: Start Apache and configure PHP settings
sudo systemctl start apache2
sudo sed -i "s/allow_url_include = Off/allow_url_include = On/" /etc/php/7.4/apache2/php.ini
sudo sed -i "s/allow_url_fopen = Off/allow_url_fopen = On/" /etc/php/7.4/apache2/php.ini

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "DVWA setup complete! Visit http://127.0.0.1/DVWA"
