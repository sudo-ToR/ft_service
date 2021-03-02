# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/12 11:55:01 by tor               #+#    #+#              #
#    Updated: 2021/02/17 15:52:37 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr

RUN apk update \
    && apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/vsftpd.key \
-out /etc/ssl/certs/vsftpd.crt \
-subj '/C=FR/ST=Paris/O=42/CN=Lina NOIROT'

COPY vsftpd.conf /etc/
COPY ftps_start.sh /tmp/

RUN adduser -D ftps && echo ftps:123456 | chpasswd

CMD sh /tmp/ftps_start.sh

EXPOSE 20 21 30000