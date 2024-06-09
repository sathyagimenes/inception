#!/usr/bin/env bash

# Enable the expansion of aliases in the shell script.
shopt -s expand_aliases

# This script sets up an alias for the 'wp' command with the '--allow-root' option.
# The 'wp' command is a command-line interface for managing WordPress installations.
# By adding the '--allow-root' option, it allows running the 'wp' command as the root user.
# This alias can be used to conveniently run 'wp' commands with root privileges.
alias wp='wp --allow-root'

# Downloads the WordPress core files
wp core download --locale="pt_BR"

# Creates a WordPress configuration file with specified database credentials.
wp config create \
  --dbname="$WP_DATABASE" \
  --dbuser="$WP_ADMIN_USER" \
  --dbpass="$WP_ADMIN_PASS" \
  --dbhost=mariadb \
  --dbprefix="wp_"

# Configures WordPress Domain and Admin User.
wp core install \
  --url="$DOMAIN" \
  --title="$WP_TITLE" \
  --admin_user="$WP_ADMIN_USER" \
  --admin_password="$WP_ADMIN_PASS" \
  --admin_email="$WP_ADMIN_EMAIL" \
  --skip-email

# Creates a WordPress user with subscriber role non-interactively.
wp user create "$WP_USER" "$WP_USER_EMAIL" \
  --user_pass="$WP_USER_PASS" \
  --role=subscriber \
  --porcelain

# Activate the Twenty Twenty-Two theme.
wp theme activate twentytwentytwo

# Execute the command passed as arguments to the script.
exec "$@"