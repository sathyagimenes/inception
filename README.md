# Inception
A Docker configuration to wordpress, mariadb and nginx

### Comando criar a imagem a partir do Dockerfile
*rodar dentro da pasta onde está localizado do Dockerfile*
sudo docker build -t mymariadb:1.0 .

### Comando para visualizar as imagens que estão ativas
sudo docker images

### Comando para executar a imagem
sudo docker run -d -p 3306:3306 mymariadb:1.0

### Comando para visualizar os containers que estão ativos
sudo docker ps

### Comando para entrar no container
sudo docker exec -it ce76bab602fa bash

### Comando para limpar ambiente
docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

# MariaDB

### Comando para entrar no database
mariadb

### Comando para listar as bases de dados
SHOW DATABASES;

### Comando para acessar a base de dados
USE wordpress_db;

### Comando para listar as tabelas da base de dados
SHOW TABLES;

# .env
### Exemplo de variaveis de ambiente para configurar no arquivo .env
LOGIN=sde-cama
DOMAIN_NAME=sde-cama.42.fr

MYSQL_USER=sde-cama
MYSQL_PASSWORD=wppass
MYSQL_HOSTNAME=mariadb
MYSQL_DATABASE=wpdb
MYSQL_ROOT_PASSWORD=:wppass

WORDPRESS_NAME=inception
WORDPRESS_USER_EMAIL=sde-cama@42.fr
WORDPRESS_ROOT_LOGIN=sde-cama
WORDPRESS_ROOT_PASSWORD=wppass
WORDPRESS_ROOT_EMAIL=sde-cama@42.fr

WORDPRESS_OTHER_NAME=sathya
WORDPRESS_OTHER_EMAIL=sathya@42.fr
WORDPRESS_OTHER_PASSWORD=wppass
