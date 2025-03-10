# Установка MySQL 8.0
sudo apt update
sudo apt install mysql-server-8.0 -y

# Загрузка и замена конфигурационного файла
sudo wget https://raw.githubusercontent.com/Altione/OTUS/refs/heads/main/Master-mysqld.cnf -O /etc/mysql/mysql.conf.d/mysqld.cnf

# Перезапуск MySQL
sudo service mysql restart

# Создание пользователя для репликации
mysql -u root -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';"

# Предоставление прав на репликацию
mysql -u root -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%';"

# Проверка логов на наличие ошибок
sudo tail -n 50 /var/log/mysql/error.log
