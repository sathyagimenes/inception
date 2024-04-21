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