# use the latest image
FROM mysql:latest

# create a label
LABEL maintainer="yemi adeoye"

# change the ownership of the /var/lib/mysql directory
RUN chown -R mysql:root /var/lib/mysql

# create environment variable args
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# assign environment variables
ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# copy mysql file
ADD ./books.sql /etc/mysql/books.sql

# initialize with mysql data
RUN cp /etc/mysql/books.sql /docker-entrypoint-initdb.d

# expose port for connection to db
EXPOSE 3306




