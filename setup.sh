# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/07 15:46:05 by tor               #+#    #+#              #
#    Updated: 2021/03/02 13:20:12 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

user=$(whoami)
id -nG $user | grep docker >> /dev/null 2>> /dev/null

permission=$?

if [ $permission -ne 0 ]; then
	echo "Permission are not correctly set up\nYou need to enter password to grant the good permissions : "
	sudo usermod -aG docker $user 2>> /dev/null
	echo "You need to log out to flush permissions"
	exit 0
fi


minikube delete
docker system prune -f
minikube config set kubernetes-version 1.18.0
minikube start --driver=docker
minikube addons enable dashboard
minikube dashboard&

#################################################################################
#                                   MetalLb configuration                       #
#################################################################################
kubectl apply -f srcs/namespace.yaml
kubectl apply -f srcs/metallb.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/config_metallb.yaml


# eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

##################################################################################
#                               Mysql                                            #
##################################################################################

docker build -t bestmysql srcs/mysql
kubectl apply -f srcs/mysql.yaml

##################################################################################
#                                   Phpmyadmin                                   #
##################################################################################

docker build -t bestphpmyadmin srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin.yaml

##################################################################################
#                                       WP                                       #
##################################################################################

docker build -t bestwordpress srcs/wordpress
kubectl apply -f srcs/wordpress.yaml

###################################################################################
#                                   Influxdb                                      #
###################################################################################

docker build -t bestinfluxdb srcs/influxdb
kubectl apply -f srcs/influxdb.yaml

###################################################################################
#                                   Grafana                                       #
###################################################################################

docker build -t bestgrafana srcs/grafana
kubectl apply -f srcs/grafana.yaml

###################################################################################
#                                   Grafana                                       #
###################################################################################

docker build -t bestftps srcs/ftps
kubectl apply -f srcs/ftps.yaml

###################################################################################
#                                   NGINX                                         #
###################################################################################

docker build -t bestnginx srcs/nginx
kubectl apply -f srcs/nginx.yaml

