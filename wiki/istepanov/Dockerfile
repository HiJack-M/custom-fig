#
# Dockerfile for dokuwiki
# powered by vimagick
#

FROM alpine
MAINTAINER jovi <noreply@jovipro.com>

WORKDIR /var/www

RUN set -xe \
    && apk add -U ca-certificates \
                  gzip \
                  nginx \
                  php-fpm \
                  php-openssl \
                  php-xml \
                  php-zlib \
                  tar \
    && wget -O- http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz | tar xz --strip 1 \
    && chown -R nobody:nobody . \
    && rm -rf /var/cache/apk/* \
    && sed -i 's/nobody/root/g' /etc/php/php-fpm.conf

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /var/www/conf \
       /var/www/data/pages \
       /var/www/data/meta \
       /var/www/data/media \
       /var/www/data/media_attic \
       /var/www/data/media_meta \
       /var/www/data/attic \
       /var/www/lib/plugins

EXPOSE 80

CMD php-fpm -R && nginx -g 'daemon off;'
