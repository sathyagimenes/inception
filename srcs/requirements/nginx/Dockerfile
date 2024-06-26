# Use the penultimate version of debian image as the base
FROM debian:bullseye

ARG LOGIN

# Install packages:
# - nginx - required, nginx itself
# - openssl - used to create self-signed SSL certificates
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install nginx openssl -y

# Generate the self-signed SSL certificates using openssl:
# - req: command used to process certificate;
# - -x509: option to create a X.509 certificate, which is a standard format for digital certificates;
# - -nodes: option to not encrypt the private key, useful for development because won't require user input;
# - -days 365: option to set the period of validity of the self-signed certificate;
# - -newkey rsa:4096: option to set the type of the key, in this case, a RSA key with 4096 bits;
# - -keyout: option to set the path where the key will be stored;
# - -out: otpion to set the path where the certificate will be stored;
# - -subj: option to set the certificate's subject specifications, such as:
#   - C: specify country;
#   - ST: specify state;
#   - L: specify locale;
#   - O: specify organization;
#   - CN: specify commom name, A.K.A. domain name.
RUN openssl req -batch -x509 \
    -sha256 -nodes -newkey rsa:4096 -days 365 \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -subj "/O=42sp/OU=42 Sao Paulo/CN=42sp.org.br"

# Copy the nginx configuration file to nginx's default configuration directory
COPY ./conf/https.conf /etc/nginx/conf.d/
COPY ./conf/ssl.conf /etc/nginx/snippets/

# This command replaces the string "LOGIN" with the value of the environment variable "LOGIN"
# in the file /etc/nginx/conf.d/nginx.conf using the sed command.
RUN sed -i "s/LOGIN/${LOGIN}/g" /etc/nginx/conf.d/https.conf

# Run nginx with arguments:
# -g daemon off; tells nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]