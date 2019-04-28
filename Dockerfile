ARG arch=amd64
FROM ${arch}/node:11.14-alpine

WORKDIR /app
VOLUME /app

USER root
RUN mkdir -p /var/run/dbus
COPY config/avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++ python
RUN npm install -g homekit2mqtt@0.9.6 --unsafe-perm

EXPOSE 5353 51826

CMD ["/app/run.sh"]

