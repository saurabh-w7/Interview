FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install nginx
RUN apt-get update \
 && apt-get install -y --no-install-recommends nginx \
 && rm -rf /var/lib/apt/lists/*

# Configure nginx to listen on port 8080 instead of 80
RUN sed -i 's/listen 80 default_server;/listen 8080 default_server;/' /etc/nginx/sites-available/default \
 && sed -i 's/listen \[::\]:80 default_server;/listen [::]:8080 default_server;/' /etc/nginx/sites-available/default


EXPOSE 8080

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

