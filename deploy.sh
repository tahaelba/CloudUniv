#!/bin/sh
docker stop $(docker ps -aq)

docker rm $(docker ps -aq)

docker run --name mysql -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes -e MYSQL_DATABASE=flaskblog -e MYSQL_USER=admin -e MYSQL_PASSWORD=user mysql/mysql-server:5.7

docker run --name webapp  -p 80:5000 --rm -e SECRET_KEY=my-secret-key -e MAIL_SERVER=smtp.googlemail.com -e MAIL_PORT=587 -e MAIL_USE_TLS=true -e MAIL_USERNAME=mail@mail.com -e MAIL_PASSWORD=PASSWORD --link mysql:dbserver -e SQLALCHEMY_DATABASE_URI=mysql+pymysql://admin:user@dbserver:3306/flaskblog flask:latest

