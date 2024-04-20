# Use the penultimate version of debian image as the base
FROM debian:bullseye

# Set variables
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASS
ARG WP_DATABASE

# Install MariaDB
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# Copy setup script to local bin directory
COPY ./tools/setup.sh /usr/bin/

# Change setup script permissions so it becomes executable
RUN chmod +x /usr/bin/setup.sh

COPY ./conf/my.cnf /etc/mysql/my.cnf

# Expose port 3306 for communication with other containers
EXPOSE 3306

# Set entrypoint to be setup script
RUN service mariadb start && /usr/bin/setup.sh

# Run MySQL daemon with address binding to 0.0.0.0* - the server will listen on all available network interfaces
CMD ["mysqld_safe"]