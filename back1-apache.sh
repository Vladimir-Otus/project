# Установка Apache2
sudo apt install apache2 -y;

# Изменение дефолтной страницы (замена текста в body)
sudo sed -i 's/Apache2 Default Page/Back1/' /var/www/html/index.html;

# Изменение заголовка (title)
sudo sed -i 's/Apache2 - Back1</' /var/www/html/index.html;
