#!/usr/bin/env bash

# Dừng các container đang chạy
sudo docker-compose stop

# Xóa các container cũ
sudo docker-compose rm -f

# Pull image mới từ Docker Hub
sudo docker-compose pull

# Chạy container mới
sudo docker-compose up -d
