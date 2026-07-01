#!/bin/sh
if [ ! -f ssl/server.crt ] || [ ! -f ssl/server.key ]; then
    echo "Сертификат не найден, генерируем..."
    ./generate_cert.sh
fi
docker build -t my-nginx-ssl .
docker stop my-nginx 2>/dev/null
docker rm my-nginx 2>/dev/null
docker run -d \
    --name my-nginx \
    -p 54321:443 \
    -v "$(pwd)/ssl:/etc/nginx/ssl" \
    my-nginx-ssl

echo "Контейнер запущен. Сайт доступен по адресу https://localhost:54321"
