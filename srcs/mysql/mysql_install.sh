# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mysql_install.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tor <tor@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/08 11:50:48 by tor               #+#    #+#              #
#    Updated: 2021/01/19 14:30:10 by tor              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mysql_install_db --user=mysql --datadir=/var/lib/mysql 
cd '/usr'
/usr/bin/mysqld
# /usr/bin/mysqld_safe --user=mysql --datadir='/var/lib/mysql' --init-file=/tmp/mysql_users.sql
