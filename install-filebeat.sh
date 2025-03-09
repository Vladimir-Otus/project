# Скачивание файла .deb
DEB_FILE="/home/vt/filebeat-8.9.1-amd64.deb"
if [ ! -f "$DEB_FILE" ]; then
    echo "Скачивание filebeat-8.9.1-amd64.deb..."
    sudo wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.9.1-amd64.deb -O "$DEB_FILE"
    if [ $? -ne 0 ]; then
        echo "Ошибка: не удалось скачать filebeat-8.9.1-amd64.deb."
        exit 1
    fi
fi

# Установка Filebeat из .deb пакета
echo "Установка Filebeat..."
sudo dpkg -i "$DEB_FILE"
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось установить Filebeat."
    echo "Попытка установить зависимости..."
    sudo apt-get install -f -y
    if [ $? -ne 0 ]; then
        echo "Ошибка: не удалось установить зависимости."
        exit 1
    fi
fi

# Скачивание конфигурации Filebeat
CONFIG_FILE="/home/vt/filebeat-Front.yml"
echo "Скачивание конфигурации Filebeat..."
wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/filebeat-Front.yml -O "$CONFIG_FILE"
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось скачать конфигурацию."
    exit 1
fi

# Копирование конфигурации в /etc/filebeat/
echo "Копирование конфигурации..."
sudo cp -f "$CONFIG_FILE" /etc/filebeat/filebeat.yml
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось скопировать конфигурацию."
    exit 1
fi

# Перезапуск Filebeat
echo "Перезапуск Filebeat..."
sudo systemctl restart filebeat
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось перезапустить Filebeat."
    exit 1
fi

echo "Filebeat успешно установлен и настроен."
