#!/bin/bash

echo "-----------START------------"

sudo yum -y update
sudo yum -y install httpd

echo "<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>" | sudo tee -a /var/www/html/index.html

# systemctl start httpd
# systemctl enable httpd
sudo systemctl enable --now httpd

# Проверяем статус сервиса
if ! systemctl status httpd &>/dev/null; then
    echo "Error: Failed to start httpd"
    exit 1
fi

echo "------Finish-------------"
---
# Скрипт для DEBIAN:
#!/bin/bash

echo "-----------START------------"

# Обновляем пакеты
sudo apt update

# Устанавливаем Apache
sudo apt -y install apache2

# Создаем index.html
echo "<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>" | sudo tee /var/www/html/index.html

# Включаем и запускаем Apache
sudo systemctl enable --now apache2

# Проверяем статус сервиса
if ! systemctl status apache2 &>/dev/null; then
    echo "Error: Failed to start apache2"
    exit 1
fi

echo "------Finish-------------"
---

# AWS VARS:
Hostname=`curl http://169.254.169.254/latest/meta-data/hostname`
PrivateIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "My server have this $PrivateIP and this hostname - $Hostname" | sudo tee -a /var/www/html/index.html