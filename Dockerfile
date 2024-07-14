# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Cài đặt OpenSSL
RUN apk add --no-cache openssl

# Tạo thư mục cho SSL/TLS configuration và copy key, cert vào
RUN mkdir -p /etc/nginx/ssl

# Tạo key và cert bằng OpenSSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/datdev.cloud.key \
    -out /etc/nginx/ssl/datdev.cloud.crt \
    -subj "/CN=datdev.cloud"

# Copy file cấu hình Nginx vào trong container
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]