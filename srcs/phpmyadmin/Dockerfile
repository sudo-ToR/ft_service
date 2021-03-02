# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/15 19:56:28 by tor               #+#    #+#              #
#    Updated: 2021/03/02 14:08:11 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr

RUN apk upgrade && apk update \
    && apk add nginx wget  openrc phpmyadmin\
    && apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-fpm php7-session openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx.key \
-out /etc/ssl/certs/nginx.crt \
-subj '/C=FR/ST=Paris/O=42/CN=Lina NOIROT'

RUN /usr/sbin/php-fpm7
COPY index.html /www/
COPY install_phpmyadmin.sh /tmp
COPY nginx.conf /tmp
COPY config.inc.php /tmp

CMD sh /tmp/install_phpmyadmin.sh

EXPOSE 5000