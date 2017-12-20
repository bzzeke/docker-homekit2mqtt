FROM arm32v6/node:alpine

WORKDIR /app
COPY /data/run.sh /app/
COPY /data/homekit2mqtt.json /app/

USER root
RUN mkdir -p /var/run/dbus

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++
RUN npm install -g homekit2mqtt --unsafe-perm

CMD ["/app/run.sh"]

