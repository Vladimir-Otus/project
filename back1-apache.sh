# Установка Apache2
apt install apache2 -y

# Заменить "Apache2 Default Page" на "Apache2 - Back1" в файле index.html
sed -i 's/Apache2 Default Page/Apache2 - Back1/' /var/www/html/index.html
