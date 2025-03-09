# Проверка наличия файла .deb
if [ ! -f /home/vt/filebeat-8.9.1-amd64.deb ]; then
    echo "Ошибка: файл /home/vt/filebeat-8.9.1-amd64.deb не найден."
    exit 1
fi

# Установка Filebeat из .deb пакета
sudo dpkg -i /home/vt/filebeat-8.9.1-amd64.deb
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось установить Filebeat."
    echo "Попытка установить зависимости..."
    sudo apt-get install -f -y
    if [ $? -ne 0 ]; then
        echo "Ошибка: не удалось установить зависимости."
        exit 1
    fi
fi

echo "Filebeat успешно установлен."

# Скачать конфигурацию для Filebeat Front
wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/filebeat-Front.yml -O /tmp/filebeat-Front.yml
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось скачать конфигурацию."
    exit 1
fi

# Заменить конфигурацию Filebeat
sudo cp -f /tmp/filebeat-Front.yml /etc/filebeat/filebeat.yml
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось скопировать конфигурацию."
    exit 1
fi

# Перезапустить и включить Filebeat
sudo systemctl restart filebeat
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось перезапустить Filebeat."
    exit 1
fi

sudo systemctl enable filebeat
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось включить автозапуск Filebeat."
    exit 1
fi

echo "Filebeat успешно установлен и настроен."
