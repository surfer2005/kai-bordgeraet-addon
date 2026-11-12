# Änderungsverlauf

## 0.1.127-1
- AirPlay-Empfänger (Bildschirm: Bild spiegeln über uxplay, Bordmusik: Ton vom iPad über shairport-sync), aus KAI ein-/ausschaltbar mit Name und PIN — standardmäßig aus.
- Sensor-Verbindungsstand wird ehrlich gemeldet (KAI erkennt einen MQTT-Abbruch sofort statt erst nach 10 Min.).
- Abgelehnte MQTT-Anmeldung wird mit Client-Name und IP protokolliert (fremdes Gerät im Bordnetz auffindbar).

## 0.1.124-1
- MQTT-B (ein Broker-Login je Bordwächter), OTA-Force (Neu-Flashen auch bei gleicher Version) und Sensor-ESPHome-Log live.

## 0.1.119-1
- Smartmeter: Host (und Port) je Zähler konfigurierbar — Schiffe mit Zählern auf mehreren IP-Adressen werden jetzt vollständig ausgelesen.

## 0.1.118-1
- Kopplung mit KAI lässt sich am Gerät wieder lösen.
- Deutsches Tastaturlayout wird erkannt.

## 0.1.117-1
- Gültige Hex-UUID im Netzwerk-Keyfile (feste IP wird zuverlässig übernommen).
- Hostname über die Netzwerk-Karte setz- und speicherbar (auch für Bildschirm/Audio-Player).

## 0.1.115-1
- Lichtseite mit „Alle Leuchten"-Schalter.
