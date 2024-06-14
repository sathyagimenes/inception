#!/usr/bin/env sh

# Use the 'mariadb' command-line client to connect to MariaDB
# -u root: Connect as the root user
# -p"$WP_ADMIN_PASS": Use the password stored in the variable $WP_ADMIN_PASS
# Creates a databasa if it doesn't exist
# Create a new user and grant all privileges on the database $WP_DATABASE 
# Flush privileges to apply the changes made by the previous statements
mariadb -u root -p"$WP_ADMIN_PASS" << EOF
CREATE DATABASE IF NOT EXISTS $WP_DATABASE;
CREATE USER '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASS';
GRANT ALL ON $WP_DATABASE.* TO '$WP_ADMIN_USER'@'%';
FLUSH PRIVILEGES;
EOF