#!/bin/bash

# $1 database name
# $2 username
# $3 user host
# $4 password
green() {
	  echo -e '\e[32m'$1'\e[m';
  }

readonly EXPECTED_ARGS=4
readonly E_BADARGS=65
readonly MYSQL=`which mysql`

# Construct the MySQL query
readonly Q1="CREATE DATABASE IF NOT EXISTS $1;SHOW DATABASES;USE $1;"
readonly Q2="CREATE '$2'@'$3' IDENTIFIED BY '$4';"
readonly Q3="GRANT ALL ON $1.* TO '$2'@'$3' IDENTIFIED BY '$4';"
readonly Q4="FLUSH PRIVILEGES;"
readonly Q5="CREATE TABLE tutorial(id INT NOT NULL AUTO_INCREMENT,title VARCHAR(100) NOT NULL,PRIMARY KEY(id));DESCRIBE tutorial;"
readonly Q6="INSERT INTO tutorial(title)VALUES('T1'),('T2'),('T3');"
readonly SQL="${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}"

# Do some parameter checking and bail if bad
if [ $# -ne $EXPECTED_ARGS ]
then
	  echo "Usage: $0 dbname dbuser dbpass"
	    exit $E_BADARGS
fi

# Run the actual command
$MYSQL -uroot -p -e "$SQL"

# Let the user know the database was created
green "Database $1 and table tutorial and user $2 created with a password you chose"
