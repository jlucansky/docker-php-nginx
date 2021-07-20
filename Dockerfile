FROM trafex/php-nginx:2.1.0

COPY config /config

USER 0

RUN rm /etc/nginx/nginx.conf && \
    rm /etc/php8/php-fpm.d/www.conf && \
    rm /etc/php8/conf.d/custom.ini && \
    rm /etc/supervisor/conf.d/supervisord.conf && \
    ln -s /config/nginx.conf /etc/nginx/nginx.conf && \
    ln -s /config/fpm-pool.conf /etc/php8/php-fpm.d/www.conf && \
    ln -s /config/php.ini /etc/php8/conf.d/custom.ini && \
    ln -s /config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

USER nobody
