# Changelog

Aenderungen an RPChatMod. Fuer nicht dokumentierte Zwischenversionen
werden keine Eintraege oder Datierungen rekonstruiert.

## Aktueller Quellstand: 0.6.1 (unveröffentlicht)

- Chefkoch-Emote-Liste (175 Einträge) abgeglichen: 172 zuvor abgedeckt, die
  Kurzformen `CURT`, `SHIV` und `YAY` als zusätzliche Aliasse ergänzt.
- Diese drei Abkürzungen benutzen `CURTSEY`, `SHIVER` und `HAPPY`
  als native WoW-Emote-Tokens und deren vorhandene gesprochene Texte.
  Die Zahl von 194 eigenständigen RP-Textpools bleibt unverändert.
- Abgleichs- und Laufzeittests für alle 175 Einträge, Aliasauflösung,
  Native-Emotes ohne doppeltes /me sowie Versionsangaben ergänzt.
- Persönliche Texte, bisherige Emote-Daten und gespeicherte
  `nativeEmotes`-Einstellungen bleiben erhalten.

## Historischer Quellstand: 0.6.0 (unveröffentlicht)

- Breite klassische WoW-Emote-Abdeckung: **210 dokumentierte Emote-Befehlsnamen** mit **194 unterschiedlichen RP-Pools** und Aliasnamen; **174 neue Emote-Schlüssel** in Deutsch, Englisch und Französisch.
- Je neuem Schlüssel zwei eigenständige allgemeine Sprechzeilen und zwei adressierte Zielvarianten. Alte Volks-, Klassen-, Volks/Klassen- und allgemeine Textsammlungen bleiben gespeichert.
- WoW übernimmt die native Emote-/Animationsausgabe. RPChatMod erzeugt für `/rc` nur noch einen möglichen gesprochenen Satz; alte `*...*`-Beschreibungen werden bei der Textauswahl übersprungen, damit keine doppelten /me-Zeilen entstehen.
- Neue Standardoption `nativeEmotes=true`. Charaktere mit bestehendem `nativeEmotes=false` behalten diese Einstellung und können `/rc native on` verwenden.
- Sprach-Fallback auf den nächsten geeigneten Pool, wenn ein höherpriorisierter älterer Pool ausschließlich beschreibende Emotes enthält.
- Regressionstests für 194 Textpools, 210 klassische Emote-Befehlsnamen, alle drei Sprachen, No-/me-Verhalten, Aliasse, gespeicherte Einstellungen und native Auslösung in Lua 5.1/5.4.

## Historischer Quellstand: 0.5.0 (unveröffentlicht)

- Zehn zusätzliche soziale Textschlüssel in DE/EN/FR ergänzt: Applaus, Entschuldigung, Jubeln, Warten, Schulterzucken, Deuten, Anstoßen, Trösten, Umarmen und Knien.
- Jeder neue Schlüssel enthält gesprochene Texte, /me-Emotes und eine zielbezogene Variante. Bisherige zehn Grundaktionen bleiben erhalten, jetzt 20 allgemeine RP-Emotes.
- CI-Regressionstest für Sprachparität und Versionsgleichheit ergänzt. Bestehende Rassen-, Klassen- und persönliche Texte bleiben unberührt.

## Historischer Quellstand: 0.4.1 (unveröffentlicht)

- Versionsangabe aktualisiert und gemeinsame Dokumentationslinks fuer
  einzelne AddOn-Checkouts erlaeutert.

## [0.4.0] - 2026-10-26

### Dokumentation

- Widerspruechliche Poolprioritaet und veraltete TOC-Angabe korrigiert.
- Ziel-/Gruppen-Fallback, Locale-Erweiterungen und gemeinsame Anleitungen
  dokumentiert, ohne Laufzeitverhalten zu aendern.

### Hinzugefuegt

- Dynamische Schluessellisten mit `/rc list`, `/rc list racial` und
  `/rc list all` ergaenzt.
- Weitere Begruessungstexte fuer Himmelsgeborene in Englisch und
  Franzoesisch ergaenzt.

## [0.3.3] - 2026-10-20

### Hinzugefuegt und behoben

- `/rc grouplanguage on|off`: Bei Gruppenmitgliedschaft fuer RP-SAY/YELL Gemeinsprache (Allianz) oder Orkisch (Horde) verwenden.
- Nach Verlassen der Gruppe wieder Volkssprache fuer die naechste RP-Nachricht; Sprache wird bei jedem Versand neu bestimmt.
- `/rc languagestatus`: Diagnose fuer Gruppenzustand, Chatkanal und effektive Sprach-ID.
- Standardwert `groupLanguageMode = "on"` mit Validierung gespeicherter Einstellungen.
- Die im WoW-Chatfenster manuell eingestellte Sprache wird nicht umgeschaltet.

## [0.3.2] - 2026-10-17

### Geaendert

- Volkssprache fuer SAY/YELL ist jetzt mit `/rc racelanguage auto|on|off` konfigurierbar.
- `auto` nutzt nur vom Client gemeldete Sprachen; `on` kann die bekannte Rassen-Sprach-ID erzwingen.
- `/rc racelangdebug` zeigt Rassentoken, erwartete Sprach-ID und die vom Client gemeldeten Sprachen.
- `/rc status` zeigt Volkssprachenmodus und erkannte Sprache.
- README-Poolprioritaet auf Rasse+Klasse -> Rasse -> Klasse -> Allgemein korrigiert.

## [0.3.1] - 2026-10-15

### Behoben

- Regression behoben: Mit `*...*` markierte RP-Aktionen werden wieder ueber EMOTE (`/me`) statt ueber SAY/YELL/Gruppenchat gesendet.
- Sternchen werden vor der Ausgabe entfernt.
- Fehlerhafte oder leere Emote-Markierungen werden abgefangen.

## [0.3.0] - 2026-10-14

### Geaendert

- Vereinheitlichte Textprioritaet: Rasse+Klasse -> Rasse -> Klasse -> Allgemein.
- Robuster ziel/gruppen-Fallback.
- Erweiterter DE/EN/FR-Social-Textvorrat.

## [2026-10-11] Sprachwahl

### Hinzugefuegt

- RP-Ausgabesprache pro Charakter: `deDE`, `enUS` oder `frFR`.
- Sprachdateien unter `locales/<locale>/`; Deutsch dient fuer fehlende
  aeltere Textpools als Fallback.
- Befehle `language` und `lang` zur Auswahl der RP-Ausgabesprache.

### Geaendert

- Locale-Tabellen werden robust einzeln initialisiert.
- Eine Sprache kann nur aktiviert werden, wenn ihre Dateien geladen wurden.
- Die Volkssprache bleibt von der RP-Ausgabesprache getrennt.

## [0.2.0] Rassenspezifische soziale Interaktionen

### Hinzugefuegt

- `FLIRT` fuer alle unterstuetzten Voelker in Deutsch, Englisch und
  Franzoesisch.
- Vollstaendige RPChat-Rassenpools fuer Tauren und Draenei.
- `YELL` als konfigurierbarer RPChat-Kanal.

### Geaendert

- Gnomische Flirts sind technisch-verspielt statt zwergisch formuliert.
- Volkssprache bleibt fuer SAY/YELL aktiv und ist von der RP-Ausgabesprache
  getrennt.

## Ausgangsstand – TOC-Version 0.1.0

### Hinzugefuegt

- Dokumentation der vorhandenen Add-on-Funktionen.
- `/rc`-Emotes `wave`, `salute`, `bow`, `laugh`, `dance`, `sit`, `sleep`,
  `thank` und `hello`.
- Rassen-, Klassen-, Rassen-/Klassen- und allgemeine Textpools mit
  zielabhaengigen Varianten. Fuer die neun aufgefuehrten Emotes bestanden
  Textdaten fuer die damals dokumentierten fuenf Rassen.
- Charaktereinstellungen fuer Textchance, Cooldown, Animationsverzoegerung
  und Chatkanal; SAY war der Standardkanal.
