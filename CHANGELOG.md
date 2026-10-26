# Changelog

Aenderungen an RPChatMod. Fuer nicht dokumentierte Zwischenversionen
werden keine Eintraege oder Datierungen rekonstruiert.

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
