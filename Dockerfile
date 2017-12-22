FROM arm32v6/node:alpine

WORKDIR /app

USER root
RUN mkdir -p /var/run/dbus
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++
RUN npm install -g homekit2mqtt --unsafe-perm

EXPOSE 5353 51826

CMD ["/app/run.sh"]

