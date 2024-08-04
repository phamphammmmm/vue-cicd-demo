#!/usr/bin/env bash


# Dừng các container đang chạy
docker-compose stop

# Xóa các container cũ
docker-compose rm -f

# Pull image mới từ Docker Hub
docker-compose pull

# Chạy container mới
docker-compose up -d
