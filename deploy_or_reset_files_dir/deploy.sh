#!/bin/bash

#Удаляем папку с проектом
rm -rf /home/stat_mil_ru/project

# Создаем директорию, если ее нет
mkdir -p /home/stat_mil_ru/project

# Клонируем репозиторий
git clone --branch master git@github.com:Alex00999/stat_miliutin_ru.git /home/stat_mil_ru/project

# Переходим в директорию с проектом
cd /home/stat_mil_ru/project/src/liveinternet

# Строим и запускаем контейнеры
docker-compose build --no-cache && docker-compose up -d

chmod +x /home/stat_mil_ru/project/src/liveinternet/nginx/https.sh

bash /home/stat_mil_ru/project/src/liveinternet/nginx/https.sh

docker-compose restart nginx

# Удаляем ненужные образы
docker image prune -a -f