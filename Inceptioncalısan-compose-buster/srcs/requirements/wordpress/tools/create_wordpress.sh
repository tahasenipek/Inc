#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress already downloaded"
else


	wget http://wordpress.org/wordpress-6.3.0.tar.gz
	tar xfz wordpress-6.3.0.tar.gz
	mv wordpress-6.3.0/* .
	rm -rf wordpress-6.3.0.tar.gz
	rm -rf wordpress-6.3.0

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

exec "$@"