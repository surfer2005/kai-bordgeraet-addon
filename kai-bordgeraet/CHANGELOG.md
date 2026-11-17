# Änderungsverlauf

## 0.1.135-1
- AirPlay-Empfänger läuft nur noch, solange in KAI „AirPlay“ als Quelle gewählt ist (mit Dauer); beendet sich auch an Bord ohne Netz über „Zurück zum Zeitplan“.
- Steckdosen (Shelly-Relais) lassen sich aus KAI schalten (0.1.134).
- EIN MQTT-Zugang je Bordgerät für alle Sensoren; Zuordnung über das Thema (0.1.133).
- AirPlay-Ton über PipeWire auf den analogen Ausgang (0.1.132).
- Netzscan wie ab 0.1.131: gezielte Pings aller eingetragenen Geräte im 30-s-Takt (aus KAI) — bei Geräten mit 0.1.127 oder älter
  suchte der Scan nur alle 5 Minuten das Netz ab, Geräte sprangen dadurch in KAI zwischen grün und rot.

## 0.1.131-1
- Netzscan pingt jetzt gezielt ALLE in KAI eingetragenen Geräte an (über den VPN-Tunnel auch an anderen Standorten) und meldet sie einzeln online/offline — löst den Home-Assistant-Netzwerk-Scanner ab.
- Erkennt ein Gerät auch, wenn es ICMP-Ping blockt (Server/Firewalls): zusätzlicher TCP-Port-Test (443/80/445/22/502 …).
- Alle Pings laufen in eine zentrale Senke mit Verlauf; „lebt/lebt nicht" ist überall gleich.

## 0.1.128-1
- Netzscan misst die Antwortzeit (RTT) je Gerät und meldet sie an KAI (Ping-Diagramm der Geräteübersicht).
- Netzscan-Takt kommt aus KAI (Vorgabe 60 s, aktuell 30 s) statt fest 5 Min.
- Heartbeat misst den eigenen Ping zu KAI und meldet ihn mit.

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
