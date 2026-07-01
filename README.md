Создать образ и запустить контейнер:
- внутри которого будет работать веб-сервер Nginx,
- отдающий статическую html страницу с приветствием с порта,
- для доступа снаружи к nginx по сети пробросить в контейнер порт 54321
- команду запуска контейнера оформить шелл-скриптом
- 
Дополнительное задание:
Сгенерировать SSL самоподписанный сертификат
Запускать nginx в контейнере с HTTPS протоколом, с сертификатом
Сертификат пробросить в контейнер через Volume Mapping
Сделать скрипт обновления (пересоздания сертификата), который будет давать внутрь докера команду nginx на перечитывание сертификата (reload)

Клонировать репозиторий и перейти в директорию:
```
git clone https://github.com/SoulEra/stud-devops_lab5.git
cd situ-devops-05
```
Выдача прав скриптам и запуск
```
chmod +x *.sh
./run.sh
```
Вывод процесса
```
root@srv-devops:/home/user/my_homework5# ./run.sh
Сертификат не найден, генерируем...
....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+..+.......+..+.+..+...+.........+....+.....+.......+...+.....+.+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*............+...+..........+.....+......+.+.....+.+...+.....................+.........+..+..........+...+..+....+.....+.+..+.....................+......+.+..............+......+.......+..+...+.+..............+................+..+.........+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
....+............+.........+.....+....+..+.+.........+.....+....+..+..........+.....+.......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*.........................+..........+..+..........+...+..+.........+...+.......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*........+...+........+...............+.......+...+.........+..+...+...+.............+..+............+.+...............+.....+.+...+..+.+.....+...............+.............+..+.......+..........................+.......+...+.....+.......+..+...............+.......+......+...+..............+.......+...+..+....+.....+....+........+...+.......+........................+...+...........+......+......+.......+.................+.........+....+.....+.+......+.....+.+...............+..+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
[+] Building 4.2s (9/9) FINISHED                                                                                                                            docker:default
 => [internal] load build definition from Dockerfile                                                                                                                  0.0s
 => => transferring dockerfile: 191B                                                                                                                                  0.0s
 => [internal] load metadata for docker.io/library/nginx:alpine                                                                                                       1.8s
 => [internal] load .dockerignore                                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                                       0.0s
 => [1/4] FROM docker.io/library/nginx:alpine@sha256:54f2a904c251d5a34adf545a72d32515a15e08418dae0266e23be2e18c66fefa                                                 1.7s
 => => resolve docker.io/library/nginx:alpine@sha256:54f2a904c251d5a34adf545a72d32515a15e08418dae0266e23be2e18c66fefa                                                 0.0s
 => => sha256:c75b9c33e8b0983941fe03793379bd5d137f641f92b4a94d1c8956d28ba77f65 20.25MB / 20.25MB                                                                      0.9s
 => => sha256:01bf363d61e6136ebd7dcaf74b303bd08ee8f849a04e2c0be5a8d03159b404f6 1.40kB / 1.40kB                                                                        0.5s
 => => sha256:ce42635eeddd348e8266227a36db92cea8a45d5177d03e9a922a7bfb25762b7f 1.21kB / 1.21kB                                                                        0.5s
 => => sha256:ab1fd90497517c799d4fb351bc1a7ae8b58e231345d4948ae8ac73c75b320b35 405B / 405B                                                                            0.6s
 => => sha256:967885d218c57d3ce2a4e906131fb25f59e6f56cce51d87dde7d74b0e7465675 955B / 955B                                                                            0.2s
 => => sha256:5b429a43b8dfa079c3ac95537bd88d5f1ac70e478c64f100b8ef6aa9c555ebc2 628B / 628B                                                                            0.2s
 => => sha256:c16defe09b2f86b04c4143bb610095be90732794fce5c56fb7185f02feadd879 1.89MB / 1.89MB                                                                        0.6s
 => => sha256:e6f31ffc071e5560b82a8685fba8214954e5721e3e49269d00958316edbe89fe 3.84MB / 3.84MB                                                                        0.3s
 => => extracting sha256:e6f31ffc071e5560b82a8685fba8214954e5721e3e49269d00958316edbe89fe                                                                             0.1s
 => => extracting sha256:c16defe09b2f86b04c4143bb610095be90732794fce5c56fb7185f02feadd879                                                                             0.1s
 => => extracting sha256:5b429a43b8dfa079c3ac95537bd88d5f1ac70e478c64f100b8ef6aa9c555ebc2                                                                             0.0s
 => => extracting sha256:967885d218c57d3ce2a4e906131fb25f59e6f56cce51d87dde7d74b0e7465675                                                                             0.0s
 => => extracting sha256:ab1fd90497517c799d4fb351bc1a7ae8b58e231345d4948ae8ac73c75b320b35                                                                             0.0s
 => => extracting sha256:ce42635eeddd348e8266227a36db92cea8a45d5177d03e9a922a7bfb25762b7f                                                                             0.0s
 => => extracting sha256:01bf363d61e6136ebd7dcaf74b303bd08ee8f849a04e2c0be5a8d03159b404f6                                                                             0.0s
 => => extracting sha256:c75b9c33e8b0983941fe03793379bd5d137f641f92b4a94d1c8956d28ba77f65                                                                             0.3s
 => [internal] load build context                                                                                                                                     0.1s
 => => transferring context: 696B                                                                                                                                     0.0s
 => [2/4] COPY nginx.conf /etc/nginx/nginx.conf                                                                                                                       0.1s
 => [3/4] COPY index.html /usr/share/nginx/html/index.html                                                                                                            0.0s
 => [4/4] RUN mkdir -p /etc/nginx/ssl                                                                                                                                 0.2s
 => exporting to image                                                                                                                                                0.3s
 => => exporting layers                                                                                                                                               0.1s
 => => exporting manifest sha256:f2b13ea506a318b4b6a625a1b6f26053bf50221ee61cdc1643a6110f079441f6                                                                     0.0s
 => => exporting config sha256:0c18a63b8cca2d2045ce0d9d6e93cce47ed754a7e559c3c3ea33540d67c13f93                                                                       0.0s
 => => exporting attestation manifest sha256:14bb7b90502a423adb74b89c0fc2ca6a439c4cdb65c80d353a09c53fef070821                                                         0.0s
 => => exporting manifest list sha256:bd9d7877a420264c49371e293ebb7561a1bc332bdcf0a37575eb23ccdf0b89f5                                                                0.0s
 => => naming to docker.io/library/my-nginx-ssl:latest                                                                                                                0.0s
 => => unpacking to docker.io/library/my-nginx-ssl:latest                                                                                                             0.0s
90378a8af3826f8622216456f25c1600ad0ba1462cf40f81e98bd7b392f8a3d6
Контейнер запущен. Сайт доступен по адресу https://localhost:54321
```

Проверка сайта
```
root@srv-devops:/home/user/my_homework5# curl -k https://localhost:54321
<!DOCTYPE html>
<html>
<head><title>Privetstvie!</title></head>
<body>
    <h1>Dobro pozhjalovat`!</h1>
    <p>This site work in Nginx-HTTPS, port 54321.</p>
</body>
</html>
root@srv-devops:/home/user/my_homework5#
```
