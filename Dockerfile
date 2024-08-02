FROM php:7.0-apache

RUN sed -i 's/deb.debian.org/archive.debian.org/g;s|security.debian.org|archive.debian.org/|g;/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update && apt-get install -y locales libzip-dev zip libpng-dev

RUN sed -i 's/# cs_CZ.UTF-8 UTF-8/cs_CZ.UTF-8 UTF-8/' /etc/locale.gen
RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen

RUN docker-php-ext-install mysqli zip gd

RUN a2enmod rewrite


