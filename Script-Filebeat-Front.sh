#установка filebeat на Front
dpkg -i *.deb

# скачать  конфигурацию для filebeat Front
wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/filebeat-Front.yml

# заменить  
cp filebeat-Front.yml /etc/filebeat/filebeat.yml

# запустить
systemctl restart filebeat
systemctl enable filebeat
