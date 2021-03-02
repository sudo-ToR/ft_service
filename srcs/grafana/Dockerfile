# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 14:07:28 by tor               #+#    #+#              #
#    Updated: 2021/03/01 20:35:00 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer=lnoirot@student.42.fr

RUN apk update && apk upgrade \
    && apk add wget

RUN apk add grafana --no-cache

COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources
COPY grafana.ini /usr/share/grafana/conf/grafana.ini
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards

RUN mkdir -p /var/lib/grafana/dashboards
COPY dashboards/* /var/lib/grafana/dashboards/

WORKDIR /usr/share/grafana 
CMD grafana-server -config /usr/share/grafana/conf/grafana.ini

EXPOSE 3000
