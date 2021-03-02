openrc boot
rc-service -S influxdb start
#  influx -execute 'create database telegraf'
# create databases telegraf
# create user telegraf with password telegraf
rc-service -S telegraf start
