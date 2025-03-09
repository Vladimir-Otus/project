Тема: "Настройка веб-сервера с балансировкой, репликацией БД и системой мониторинга на базе ELK и Grafana"
Я буду использовать схему с 4-мя виртуальными машинами с Ubuntu 24.10
№	Название	IP - адрес	Установленные пакеты
1	Front	192.168.8.102	Nginx
2	Back1	192.168.8.103	Apache2 + MySQL (Master)
3	Back2	192.168.8.104	Apache2 + MySQL (Replica)
4	Monitor	192.168.8.105	ELK + Grafana
![image](https://github.com/user-attachments/assets/8b20feec-3398-4cf0-869c-eed5deb305dc)
