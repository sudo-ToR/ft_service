# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/07 15:46:05 by tor               #+#    #+#              #
#    Updated: 2021/01/20 11:58:14 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

minikube config set kubernetes-version 1.18.0
minikube start --driver=docker
minikube addons enable dashboard
minikube dashboard&

#################################################################################
#                                   MetalLb configuration                       #
#################################################################################
kubectl apply -f namespace.yaml
kubectl apply -f metallb.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f config_metallb.yaml


# eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

##################################################################################
#                               Mysql                                            #
##################################################################################

docker build -t bestmysql mysql
kubectl apply -f service_mysql.yaml

##################################################################################
#                                   Phpmyadmin                                   #
##################################################################################

docker build -t bestphpmyadmin phpmyadmin
kubectl apply -f service_phpmyadmin.yaml



