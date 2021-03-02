CREATE DATABASE wordpress;
CREATE USER 'usertest'@'localhost' IDENTIFIED BY 'password';
GRANT SHOW DATABASES ON * . * TO 'usertest'@'localhost';
CREATE USER 'usertestbis'@'localhost' IDENTIFIED BY 'password';
GRANT SHOW DATABASES ON * . * TO 'usertestbis'@'localhost';
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
FLUSH PRIVILEGES;