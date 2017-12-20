#!/bin/sh

rm -f /var/run/dbus/pid /var/run/avahi-daemon/pid

dbus-daemon --system
avahi-daemon -D

HOST="mqtt://$MQTT_HOST"

/usr/local/bin/homekit2mqtt -u $HOST -m /app/homekit2mqtt.json

