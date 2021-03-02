# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/27 17:06:44 by tor               #+#    #+#              #
#    Updated: 2021/02/05 12:09:37 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr
ENV TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
ENV INFLUXDB_HTTP_HTTPS_ENABLED=true
ENV INFLUXDB_SUBSCRIBER_INSECURE_SKIP_VERIFY=false
ENV INFLUXDB_CONFIG_PATH=/etc/influxdb.conf
ENV INFLUX_DB=telegraf
ENV INFLUXDB_USER=telegraf
ENV INFLUXDB_USER_PASSWORD=telegraf


RUN apk update && apk upgrade \
    && apk add influxdb --no-cache \
    && apk add openrc

RUN apk add --repository http://nl.alpinelinux.org/alpine/edge/community telegraf

RUN apk add --repository http://nl.alpinelinux.org/alpine/edge/community influxdb-openrc

COPY install_influx.sh /tmp
COPY telegraf.conf /etc/
COPY influxdb.conf /etc/

CMD  sh /tmp/install_influx.sh && telegraf --debug


EXPOSE 8086
EXPOSE 8083