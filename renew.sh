#!/bin/sh
echo "Генерируем новый сертификат..."
./generate_cert.sh

echo "Перезагружаем Nginx в контейнере..."
docker exec my-nginx nginx -s reload

echo "Сертификат обновлён, Nginx перечитал конфигурацию."