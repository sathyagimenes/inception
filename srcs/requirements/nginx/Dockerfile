# Use the penultimate version of debian image as the base
FROM debian:bullseye

# Install packages:
# - nginx - required, nginx itself
# - openssl - used to create self-signed SSL certificates
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nginx openssl -y

# TODO: continuar

# Arguments to run nginx
# -g daemon off; tells nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]