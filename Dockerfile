FROM centos:7
MAINTAINER Nick Hilhorst <nick.hilhorst@asr.nl>

# We installeren alleen php en composer. Composer haalt runtime de andere dependencies op van packagist.org
RUN yum update -y -q && \
    yum install -y -q php git && \
    php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" && \
    php -r "copy('https://composer.github.io/installer.sig', '/tmp/composer-setup.sig');" && \
    php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; }" &&\
    php /tmp/composer-setup.php && \
    php -r "unlink('/tmp/composer-setup.php');" && \
    php composer.phar -V
