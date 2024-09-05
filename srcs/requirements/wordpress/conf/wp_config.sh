#!/bin/sh

#WORKDIR /var/www/html/
cd /var/www/html/wordpress

#check if wp-config.php exist
if ! wp core is-installed --allow-root; then
sleep 10
wp config create --allow-root --dbname=${MYSQL_DATABASE} \
			--dbuser=${MYSQL_USER} \
			--dbpass=${MYSQL_PASSWORD} \
			--dbhost=${MYSQL_HOST} \
			--url=https://${DOMAIN_NAME};

wp core install	--allow-root \
			--url=https://${DOMAIN_NAME} \
			--title=${SITE_TITLE} \
			--admin_user=${ADMIN_USER} \
			--admin_password=${ADMIN_PASSWORD} \
			--admin_email=${ADMIN_EMAIL};

wp user create --allow-root \
			${USER_LOGIN} ${USER_MAIL} \
			--role=author \
			--user_pass=${USER_PASS} ;

wp cache flush --allow-root

# it provides an easy-to-use interface for creating custom contact forms and managing submissions, as well as supporting various anti-spam techniques
wp plugin install contact-form-7 --activate --allow-root

# set the site language to English
wp language core install en_US  --activate --allow-root

# remove default themes and plugins
wp theme delete --all --force --allow-root
wp plugin delete hello --allow-root

# Install from a remote zip file
wp theme install https://downloads.wordpress.org/theme/twentyseventeen.3.5.zip --allow-root
wp theme activate twentyseventeen --allow-root
# set the permalink structure
wp rewrite structure '/%postname%/' --allow-root

fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

# start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground
exec  /usr/sbin/php-fpm7.4 -F -R
