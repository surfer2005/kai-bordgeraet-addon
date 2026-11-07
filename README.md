# KAI-Bordgerät als Home-Assistant-Add-on

Übergangslösung für Schiffe, auf denen schon ein Home-Assistant-Rechner läuft (z. B. MS-KONSTANZ): dieselbe Software
wie auf dem Raspberry-Bordwächter, nur als Add-on. Home Assistant läuft unverändert weiter.

**Was geht:** Kopplung mit KAI, GPS über den Teltonika-Router, Smartmeter per Modbus, Sensoren (Shelly/ESPHome/Web-IO
per MQTT), Licht über das Lunatone-DALI-Gateway, Lichtplan, Bedienung aus KAI und dem Schiffsterminal.
**Was nicht geht:** Lampe/Hupe/Taster (keine GPIO-Pins), Anzeige am Monitor, Objekterkennung, Selbstaktualisierung
(das Add-on wird in Home Assistant aktualisiert).

## Installieren
**Lokal (ohne GitHub):** den Ordner `kai-bordgeraet` auf den Home-Assistant-Rechner nach `/addons/kai-bordgeraet`
kopieren (Add-on „Samba share“ → Freigabe `addons`, oder „Terminal & SSH“). Dann Einstellungen → Add-ons →
Add-on-Store → ⋮ → „Nach Updates suchen“ → unter „Lokale Add-ons“ erscheint „KAI-Bordgerät“ → Installieren, Starten.

**Über ein Repository:** dieses Verzeichnis als GitHub-Repository veröffentlichen und in Home Assistant unter
Add-on-Store → ⋮ → Repositories eintragen.
3. Geräteseite öffnen: `http://<Home-Assistant-Rechner>:8090` → KAI-Adresse eintragen → in KAI unter
   Administration → Monitoring → Schiffe & Landestellen einen Bordwächter anlegen, Code erzeugen, am Gerät eingeben.

## MQTT-Port
Der Mosquitto von Home Assistant belegt Port 1883 (und 1884 für Websockets). Der Sensor-Empfänger des Add-ons läuft deshalb auf **1885**
(einstellbar unter Konfiguration → `mqtt_port`). Sensoren und das Web-IO tragen als MQTT-Server
`<Home-Assistant-Rechner>:1885` ein. Wird Mosquitto später entfernt, kann der Port auf 1883 zurück.
