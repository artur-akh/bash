#!/bin/bash

echo "-----------START------------"

# Обновляем пакеты
sudo yum -y update

# Устанавливаем Nginx
sudo yum -y install nginx

# Создаем index.html
echo "<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>" | sudo tee /usr/share/nginx/html/index.html

# Включаем и запускаем Nginx
sudo systemctl enable --now nginx

# Проверяем статус сервиса
if ! systemctl status nginx &>/dev/null; then
    echo "Error: Failed to start nginx"
    exit 1
fi

echo "------Finish-------------"
---

# Скрипт для DEBIAN:
#!/bin/bash

echo "-----------START------------"

# Обновляем пакеты
sudo apt update

# Устанавливаем Nginx
sudo apt -y install nginx

# Создаем index.html
echo "<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>" | sudo tee /var/www/html/index.html

# Включаем и запускаем Nginx
sudo systemctl enable --now nginx

# Проверяем статус сервиса
if ! systemctl status nginx &>/dev/null; then
    echo "Error: Failed to start nginx"
    exit 1
fi

echo "------Finish-------------"
---

# AWS VARS:
Hostname=`curl http://169.254.169.254/latest/meta-data/hostname`
PrivateIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "My server have this $PrivateIP and this hostname - $Hostname" | sudo tee -a /var/www/html/index.html