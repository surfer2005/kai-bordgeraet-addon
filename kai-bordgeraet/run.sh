#!/usr/bin/with-contenv bashio
# KAI-Bordgerät im Add-on: Einstellungen und Zustand liegen in /data (bleibt bei Updates erhalten).
export KAI_ADDON=1
export BORDWAECHTER_CONFIG=/data/config.json
export BORDWAECHTER_MQTT_PORT="$(bashio::config 'mqtt_port')"
bashio::log.info "KAI-Bordgerät startet – Geräteseite auf Port 8090, Sensor-MQTT auf Port ${BORDWAECHTER_MQTT_PORT}"
# Der Dienst beendet sich nach dem Speichern von Einstellungen selbst, um neu zu laden — dann gleich wieder starten.
while true; do
  /usr/local/bin/bordwaechter || bashio::log.warning "Bordgerät beendet (Code $?) – Neustart in 3 s"
  sleep 3
done
