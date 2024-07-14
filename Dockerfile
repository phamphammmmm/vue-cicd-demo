# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Copy Nginx configuration files
COPY ./nginx/conf.d/ /etc/nginx/conf.d/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/ssl/ /etc/nginx/ssl/
COPY ./nginx/domain/datdev.cloud.cert /etc/nginx/cert/datdev.cloud.cert
COPY ./nginx/domain/datdev.cloud.key /etc/nginx/cert/datdev.cloud.key


# Remove default Nginx configuration if needed
RUN rm -rf /etc/nginx/conf.d/default.conf

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
# COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]