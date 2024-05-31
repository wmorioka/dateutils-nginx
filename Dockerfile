FROM nginx:1.21.6

RUN apt-get update && apt-get install -y logrotate cron
COPY logrotate.conf /etc/logrotate.conf
COPY logrotate-cron /etc/cron.d/logrotate-cron
RUN chmod 0644 /etc/cron.d/logrotate-cron
RUN crontab /etc/cron.d/logrotate-cron

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.production.conf /etc/nginx/conf.d/dateutils.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf