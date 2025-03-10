# Установка MySQL 8.0
sudo apt update
sudo apt install mysql-server-8.0 -y

# Загрузка и замена конфигурационного файла
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/Slave-mysql.cnf -O /etc/mysql/mysql.conf.d/mysqld.cnf

# Перезапуск MySQL
sudo service mysql restart

### на всякий случай останавливаем текущую репликацию
mysql -u root -e "STOP REPLICA;"

### Устанавливаем мастер для реплики
mysql -u root -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='172.16.10.110', SOURCE_USER='repl', SOURCE_PASSWORD='oTUSlave#2020', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"

### Стартуем реплику
mysql -u root -e "START REPLICA;"
