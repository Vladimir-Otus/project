# Установка Filebeat из .deb пакета
sudo dpkg -i *.deb
if [ $? -ne 0 ]; then
    echo "Ошибка: не удалось установить Filebeat."
    exit 1
fi

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
