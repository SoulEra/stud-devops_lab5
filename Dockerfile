FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
RUN mkdir -p /etc/nginx/ssl
EXPOSE 80 443
