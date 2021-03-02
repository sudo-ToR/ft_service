# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/17 16:00:53 by tor               #+#    #+#              #
#    Updated: 2021/02/17 20:36:45 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr

RUN apk update \
    && apk add nginx openrc openssl\
    && apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-fpm php7-session

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx.key \
-out /etc/ssl/certs/nginx.crt \
-subj '/C=FR/ST=Paris/O=42/CN=Lina NOIROT'

RUN /usr/sbin/php-fpm7

COPY index.html /www/
COPY install_nginx.sh /tmp
COPY nginx.conf /tmp


CMD sh /tmp/install_nginx.sh && tail -f /etc/passwd

EXPOSE 80 443