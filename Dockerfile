FROM nginx:alpine
COPY web-app/. /usr/share/nginx/html
