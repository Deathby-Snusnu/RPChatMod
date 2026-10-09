# Changelog

Dieses Dokument beschreibt die Änderungen am vorhandenen Quellstand.
Eine frühere Release-Historie liegt nicht vor und wird nicht rekonstruiert.

## [Unreleased]

### Geändert

- Textaufbau und Cooldownstart verwenden dieselben Kernfunktionsnamen wie die
  Klassen-AddOns (`BuildText`, `StartCooldown`); bisherige Kernnamen und
  globale Integrationswrapper bleiben erhalten.
- Private Addon-Tabelle für interne Funktionen, Einstellungen und Textdaten
  eingeführt; bestehende globale Funktionen als dünne Wrapper erhalten.
  Globale Einstellungen und Texttabellen entfallen.
- Standardwerte unter `addon.defaults` von der Charakterdatenbank getrennt;
  Chance, Cooldown und Kanal direkt aus der Datenbank gelesen.
- DB-Initialisierung, Textauswahl und Slash-Befehle in eigene Module ausgelagert.
- Die bisher wirksame Sendefunktion einschließlich Sprachwahl in `core/Chat.lua`
  zentralisiert; die doppelte Definition entfernt.
- Emote-Ablauf nach `core/Emotes.lua` verschoben und die Hauptdatei auf
  Login-Initialisierung, öffentliche API und Slash-Registrierung reduziert.
- TOC-Ladefolge an die Modulstruktur angepasst.
- Deutsche Dokumentation mit relativen Links, Integrationsschnittstellen,
  Testanleitung und ausdrücklich beschriebenen Verhaltensregeln aktualisiert.
- Strikte ganze Zahlen für Chance (0–100) und Cooldown (0–3600).
- Beschädigte gespeicherte Werte mit Meldung repariert, gültige Werte erhalten.
- Nicht verfügbare explizite Gruppenkanäle brechen ab; nur AUTO fällt auf SAY zurück.
- Erster Text sofort möglich, Cooldown nur nach erfolgreichem Chat-API-Aufruf.
- Literale `%s`-Ersetzung und Textprüfung: maximal 255 Bytes, keine
  Zeilenumbrüche oder Chat-Markierungen.
- Sprachunabhängige Sprach-IDs und Scourge/Undead-Normalisierung.

### Hinzugefügt

- `/rc help`, `/rc list`, `/rc status` und `/rc channel` als Kanalabfrage.
- Gezielte Kanalwahl über PARTY, RAID und INSTANCE_CHAT zusätzlich zu den
  bestehenden say/group/instance/auto-Aliasen.
- Öffentliche `RPChatMod.TryText`-/`DoEmote`-API mit boolescher Rückgabe
  und sicherer Ablehnung vor `PLAYER_LOGIN`.
- TOC-gesteuerte Source-only-Regressionstests mit WoW-Mocks und Testloader
  für Lua 5.1 und Lua 5.4.

Textbestände, Poolprioritäten, gültige Charakterwerte und Animation
unabhängig von Textchance, Cooldown und Textausgabe bleiben erhalten.

## Ausgangsstand (Versionsnummer in der TOC: 0.1.0)

- Dokumentation der vorhandenen Add-on-Funktionen in der README ergänzt.
- Der `/rc`-Befehl unterstützt die Emotes `wave`, `salute`, `bow`, `laugh`,
  `dance`, `sit`, `sleep`, `thank` und `hello`.
- RP-Texte werden zufällig aus rassen-, klassen-, rassen-/klassen- oder
  allgemeinen Textpools ausgewählt und können abhängig vom Ziel variieren.
  Für alle neun aufgeführten Emotes gibt es Texte für die fünf in
  `data/Races.lua` aufgeführten Rassen.
- Einstellungen für Textchance, Abklingzeit, Animationsverzögerung und
  Chatkanal sind dokumentiert. Der Chatkanal ist pro Charakter konfigurierbar
  und standardmäßig auf SAY gesetzt.
