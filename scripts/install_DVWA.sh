#!/bin/bash

# Function to execute MySQL commands
execute_mysql() {
    echo "Executing MySQL command: $1"
    sudo mysql -u root -p -e "$1"
}

# Step 0.5: Delete old stuff
echo "Step 0.5: Cleaning up old DVWA installation..."
execute_mysql "DROP DATABASE IF EXISTS dvwa;"
execute_mysql "DROP USER IF EXISTS 'dvwa'@'127.0.0.1';"
sudo rm -rf /var/www/html/DVWA
echo "Old DVWA installation removed."

# Step 1: Navigate to /var/www/html and clone DVWA
echo "Step 1: Cloning DVWA from GitHub..."
cd /var/www/html || exit
sudo git clone https://github.com/ethicalhack3r/DVWA
echo "DVWA cloned successfully."

# Step 2: Set permissions for DVWA folder
echo "Step 2: Setting permissions for DVWA folder..."
sudo chmod -R 777 DVWA
echo "Permissions set."

# Step 3: Copy and configure the config file
echo "Step 3: Copying and configuring the config file..."
cd DVWA/config || exit
sudo cp config.inc.php.dist config.inc.php
echo "Config file copied."

# Optional: Customize the DB user and password
echo "Customizing the database user and password in config file..."
sudo sed -i "s/'root'/'dvwa'/" config.inc.php
sudo sed -i "s/''/'dvwa'/" config.inc.php
echo "Database user and password customized."

# Step 4: Start MySQL and configure the database
echo "Step 4: Starting MySQL and configuring the database..."
sudo systemctl enable mysql
sudo systemctl start mysql

# Create database and user in a single MySQL session
echo "Creating database and user..."
execute_mysql "CREATE DATABASE dvwa;"
execute_mysql "CREATE USER 'dvwa'@'127.0.0.1' IDENTIFIED BY 'p@ssw0rd';"
execute_mysql "GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'127.0.0.1';"
execute_mysql "FLUSH PRIVILEGES;"
echo "Database and user created successfully."

# Step 5: Start Apache and configure PHP settings
echo "Step 5: Starting Apache and configuring PHP settings..."
sudo systemctl enable apache2
sudo systemctl start apache2
sudo sed -i "s/allow_url_include = Off/allow_url_include = On/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/allow_url_fopen = Off/allow_url_fopen = On/" /etc/php/8.2/apache2/php.ini
echo "PHP settings configured."

# Restart Apache to apply changes
echo "Restarting Apache to apply changes..."
sudo systemctl restart apache2
echo "Apache restarted."

echo "DVWA setup complete! Visit http://127.0.0.1/DVWA"
