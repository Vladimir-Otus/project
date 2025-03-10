# Установка Prometheus
sudo apt update
sudo apt install prometheus -y
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Установка Grafana OSS
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/oss/release/grafana_11.5.1_amd64.deb
sudo dpkg -i grafana_11.5.1_amd64.deb

# Рестарт демона и запуск сервера Grafana
sleep 3
sudo systemctl daemon-reload
sleep 3
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Удаление пакета Grafana
rm -r grafana_11.5.1_amd64.deb

# Проверка статуса сервисов
sudo systemctl status prometheus
sudo systemctl status grafana-server

# Открытие портов (если используется ufw)
sudo ufw allow 9090/tcp
sudo ufw allow 9100/tcp
