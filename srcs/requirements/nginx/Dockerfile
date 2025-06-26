FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY tools/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 443

CMD ["/usr/local/bin/setup.sh"]