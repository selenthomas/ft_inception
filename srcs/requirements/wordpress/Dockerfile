FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install mariadb-client
RUN apt-get -y install default-mysql-client

# a command-line interface for WordPress, you can manage WordPress once it's downloaded
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.4.3-fr_FR.tar.gz   \
	&& rm /var/www/html/wordpress-6.4.3-fr_FR.tar.gz 

#WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www/* \
&& chmod -R 755 /var/www/*

#We expose the 9000 port
EXPOSE 9000

COPY ./conf/wp_config.sh ./wp_config.sh
RUN  chmod +x ./wp_config.sh

# Copy the .conf in the html directory
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
ENTRYPOINT [ "bash", "./wp_config.sh" ]