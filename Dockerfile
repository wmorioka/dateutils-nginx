FROM nginx:1.21.6

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.production.conf /etc/nginx/conf.d/dateutils.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf