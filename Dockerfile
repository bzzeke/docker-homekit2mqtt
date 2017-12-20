FROM arm32v6/node:alpine

WORKDIR /app
#COPY /data/run.sh /app/
#COPY /data/homekit2mqtt.json /app/

USER root
RUN mkdir -p /var/run/dbus
#RUN chmod 755 /app/run.sh

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++
RUN npm install -g homekit2mqtt --unsafe-perm

EXPOSE 5353 51826

CMD ["/app/run.sh"]

