# Use the penultimate version of debian image as the base
FROM debian:bullseye

# Set variables
ARG WP_ADMIN_USER
ARG WP_ADMIN_PASS
ARG WP_DATABASE

# Install MariaDB
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install mariadb-server -y

# Copy configuration file to the container's etc directory
RUN echo "[mysqld] \n\
skip-networking=0 \n\
skip-bind-address" >> /etc/mysql/my.cnf

# Copy setup script to the container's bin directory
COPY conf/ /usr/bin/
# Change setup script permissions so it becomes executable
RUN chmod +x /usr/bin/setup.sh

# Expose port 3306 for communication with other containers
EXPOSE 3306

# Starts the MariaDB service and execute the setup script
RUN service mariadb start && /usr/bin/setup.sh

# Run MySQL daemon with address binding to 0.0.0.0* - the server will listen on all available network interfaces
CMD ["mysqld_safe"]