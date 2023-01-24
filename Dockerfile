FROM ubuntu:20.04

# Make sure that we don’t get annoying prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install our best friends; Apache, MySQL, and PHP. And also some other stuff
# that we may or may not need
RUN apt update \
    && \
    apt install -y \
    wordpress \
    php \
    libapache2-mod-php \
    mysql-server \
    php-mysql \
    php-mbstring \
    php-zip \
    php-gd \
    php-json \
    php-curl \
    phpmyadmin \
    htop \
    less \
    vim \
    sl \
    && \
    ln -s /usr/games/sl /usr/bin/sl

# Configure Apache so that it can serve WordPress and phpMyadmin
COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
COPY phpmyadmin.conf /etc/apache2/sites-available/phpmyadmin.conf

# Make sure that Apache will actually serve our applications
RUN a2ensite wordpress
RUN a2ensite phpmyadmin
RUN a2enmod rewrite

# Create database accounts
RUN service mysql start \
    && \
    mysql -e 'CREATE DATABASE wordpress;' \
    && \
    mysql -e "CREATE USER wordpress@localhost IDENTIFIED BY 'wordpress';" \
    && \
    mysql -e "GRANT ALL ON wordpress.* TO wordpress@localhost;" \
    && \
    mysql -e "CREATE USER phpmyadmin@localhost IDENTIFIED BY 'phpmyadmin';" \
    && \
    mysql -e "GRANT ALL ON *.* TO phpmyadmin@localhost;" \
    && \
    mysql -e "CREATE USER pma@localhost IDENTIFIED BY 'pmapass';" \
    && \
    mysql -e "GRANT ALL ON *.* TO pma@localhost;" \
    && \
    mysql -e 'FLUSH PRIVILEGES;'

# Configure applications with database credentials
COPY phpmyadmin-config.php /etc/phpmyadmin/config-db.php
COPY wordpress-config.php /etc/wordpress/config-localhost.php

# This doesn’t do much, but at least we’ve installed and configured something
RUN apt install -y ufw
RUN ufw allow 1:443/tcp

# Why would you want this? I don’t know, but let’s do it anyway
EXPOSE 1-443

CMD \
    service apache2 start \
    && \
    service mysql start \
    && \
    sleep infinity
