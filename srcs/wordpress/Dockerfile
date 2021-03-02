# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 19:56:32 by tor               #+#    #+#              #
#    Updated: 2021/03/02 14:58:25 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr

RUN apk update && apk upgrade \
    && apk add nginx openrc \
    && apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-fpm php7-session php7-phar sudo curl

RUN mkdir /run/nginx && mkdir -p www/wp

COPY install_wordpress.sh /tmp
COPY nginx.conf /etc/nginx
COPY wp-config.php /tmp

RUN adduser -D -g 'wp' wp \
    && chown -R wp:wp /www/ \
    && chown -R nginx /www/

RUN cd /tmp \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /tmp/wp-cli.phar \
    && mv /tmp/wp-config.php /www/wp

RUN cd /www/wp \
    && mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN chmod -R 777 /www/ \ 
    && su - wp -c 'wp core download --path=/www/wp'

CMD sh /tmp/install_wordpress.sh && tail -f /etc/passwd

EXPOSE 5050