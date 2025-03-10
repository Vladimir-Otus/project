# закинул deb пакеты в home
# меняем hostname для конфига elasticsearch надо
sudo hostnamectl set-hostname ELK-Grafana
sudo sed -i "s/^127.0.1.1 .*/127.0.1.1 ELK-Grafana/" /etc/hosts
echo "Hostname изменен на: $(hostname)"

# для работы нужен jdk
sudo apt install default-jdk -y

# устанавливаем пакеты пачкой из папки ELK
#cd ELK
sudo dpkg -i *.deb
sudo apt-get install -f -y  # Установка недостающих зависимостей

# устанавливаем лимиты для оперативки
sudo mkdir -p /etc/elasticsearch/jvm.options.d
echo -e "-Xms1g\n-Xmx1g" | sudo tee /etc/elasticsearch/jvm.options.d/jvm.options > /dev/null

# скачиваем конфиги
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/elasticsearch.yml
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/filebeat.yml
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/kibana.yml
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/logstash.yml
sudo wget https://raw.githubusercontent.com/Vladimir-Otus/project/refs/heads/main/logstash-nginx.conf

# копируем в нужные папки
sudo cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo cp filebeat.yml /etc/filebeat/filebeat.yml
sudo cp kibana.yml /etc/kibana/kibana.yml
sudo cp logstash.yml /etc/logstash/logstash.yml
sudo cp logstash-nginx-es.conf /etc/logstash/conf.d/logstash-nginx-es.conf

# рестартуем все возможное
sudo systemctl daemon-reload
sudo systemctl enable --now elasticsearch.service
sudo systemctl enable --now kibana.service
sudo systemctl enable --now logstash.service
sudo systemctl enable --now filebeat.service

sudo systemctl restart elasticsearch
sudo systemctl restart kibana
sudo systemctl restart logstash
sudo systemctl restart filebeat
