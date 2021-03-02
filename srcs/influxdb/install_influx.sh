openrc boot
rc-service influxdb start
#  influx -execute 'create database telegraf'
# create databases telegraf
# create user telegraf with password telegraf
rc-service telegraf start
