# Установка Nginx
apt install nginx -y;

# Скачать nginx site-enable default и переместить
wget https://github.com/Vladimir-Otus/project/blob/ced4b94fc1f674bb108894f88c453295c1fe23d6/nginx-sites-available
cp nginx-sites-available /etc/nginx/sites-available/default;

# рестарт nginx
systemctl restart nginx;

# установка Промитея
apt install prometheus -y;
