server {
    listen 80;
    server_name datdev.cloud;

    # Redirect HTTP to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name datdev.cloud;

    ssl_certificate      /etc/nginx/ssl/datdev.cloud.bundle.crt;
    ssl_certificate_key  /etc/nginx/ssl/datdev.cloud.key;

    root /usr/share/nginx/html;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # Additional configurations as needed
}
