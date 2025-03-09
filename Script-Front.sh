# Установка Nginx
sudo apt install nginx -y;

# Скачать nginx site-enable default и переместить
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/nginx-sites-available
sudo cp nginx-sites-available /etc/nginx/sites-available/default;

# рестарт nginx
sudo systemctl restart nginx;

# установка Промитея
sudo apt install prometheus -y;
