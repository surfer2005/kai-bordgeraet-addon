# Änderungsverlauf

## 0.1.146-1
- ESPHome-Sensoren: Ein Anstoß „Auf Sensor aufspielen“ aus KAI wird dauerhaft gemerkt. Vorher spielte das Bordgerät nach
  jedem eigenen Neustart dieselbe Firmware noch einmal auf.
- ESPHome-Sensoren: Die IP-Adresse kommt aus der Verbindung des Sensors (für den Link zur Geräteseite in KAI) — die eigene
  Meldung des Sensors kam nicht zuverlässig an.
- Neue Firmware spielt das Bordgerät nur noch auf, wenn sie in KAI ausdrücklich freigegeben ist (gebaut allein genügt nicht mehr).

## 0.1.145-1
- ESPHome-Sensoren: Die Firmware wird mit Größenangabe ausgeliefert. Ohne sie brach ein ESP8266 (z. B. ESP-01S) das Update
  ab („Flash erase failed“) — ein Update aus der Ferne war für diese Sensoren bisher nicht möglich.
- Update-Fortschritt: Das Bordgerät zählt mit, wie viel der Sensor schon geladen hat, und meldet es an KAI.

## 0.1.144-1
- Sensoren: Meldet ein Fühler „nan“ (ESPHome, z. B. DHT11 liest nicht), ist das kein Messwert mehr. Vorher nahm das Bordgerät
  es als Zahl an, die Sendung an KAI ging leer raus (HTTP 400), blieb im Puffer stecken und hielt die Werte ALLER Sensoren dieses
  Bordgeräts auf. Zusätzlich geht nie mehr eine leere Anfrage an KAI, wenn das Verpacken scheitert.
- Die Selbstanzeige von ESPHome (esphome/discover/…) erscheint nicht mehr als „Nachricht ohne passenden Sensor“.

## 0.1.143-1
- Sensoren: Der MQTT-Empfänger protokolliert jetzt auch Verbindungen, die nie angemeldet wurden — mit IP und Grund
  (falsche Protokollversion, unvollständige Anmeldung, erstes Paket keine Anmeldung, Abbruch). Vorher stand dort nur ein
  falsches Kennwort. Angenommene Anmeldungen erscheinen kurz („Sensor angemeldet“, je Gerät höchstens alle 6 Stunden),
  Nachrichten unter einem Thema, das zu keinem Sensor in KAI passt, ebenfalls.

## 0.1.142-1
- GPS: Hat der Teltonika-Router keinen aktuellen GPS-Fix (älter als 5 Minuten), übernimmt das Bordgerät seine letzte
  Koordinate nicht mehr als Position. Der Router behält sie sonst tagelang, und das Schiff „stand“ in KAI, obwohl es fuhr.
- Smartmeter: Messwerte bekommen ihre Messzeit erst, wenn die Uhr seit dem Start einmal übers Netz abgeglichen ist. Davor
  bleibt sie leer und KAI nimmt die Ankunftszeit — sonst trug ein Wert nach einem Neustart die alte Uhrzeit.

## 0.1.141-1
- Smartmeter: ein Zähler, der nicht antwortet (z. B. stromloser Landanschluss), bremst den Takt nicht mehr. Antwortet schon
  die erste Anfrage nicht, lässt das Bordgerät seine übrigen Werte in diesem Durchgang aus und fragt ihn beim nächsten wieder.
  Vorher wartete es je Wert 5 Sekunden, und alle Zähler kamen nur noch alle 1,5 bis 2,5 Minuten statt alle 30 Sekunden.

## 0.1.140-1
- Smartmeter ohne Verbindung zu KAI: die Zählerwerte gehen nicht mehr verloren. Das Bordgerät liest mit der zuletzt bekannten
  Zähler-Einstellung weiter, merkt sich ohne Netz alle 5 Minuten einen Satz Werte mit Messzeit (in /data, übersteht Neustart
  und Update, bis etwa 14 Tage) und liefert sie nach, sobald KAI wieder erreichbar ist — älteste zuerst.

## 0.1.138-1
- Shelly: „MQTT-Steuerung einschalten“ aus KAI — das Bordgerät stellt am Shelly im Schiffsnetz MQTT.SetConfig
  (enable_rpc + enable_control) um und startet ihn auf Wunsch neu; Ergebnis als Rückmeldung in KAI. Nur Adressen im Bordnetz.

## 0.1.137-1
- Bordmusik: veraltete Browser-Profilsperre wird vor jedem Start entfernt (nach geändertem Gerätenamen startete der
  Browser sonst nicht); schweigt die Abspielseite auch nach dem Wechsel der Betriebsart, startet er mit frischem Profil.

## 0.1.136-1
- Bordmusik ohne Monitor: meldet sich die Abspielseite 90 Sekunden nach dem Start nicht, obwohl KAI erreichbar ist,
  startet das Gerät den Browser in der anderen Betriebsart neu (Desktop-Sitzung ↔ unsichtbar).

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
