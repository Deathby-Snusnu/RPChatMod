# Changelog

## 0.3.1 - 2026-10-15
- Regression behoben: Mit `*...*` markierte RP-Aktionen werden wieder ueber EMOTE (`/me`) statt ueber SAY/YELL/Gruppenchat gesendet.
- Sternchen werden vor der Ausgabe entfernt.
- Fehlerhafte oder leere Emote-Markierungen werden abgefangen.

## 0.3.0 - 2026-10-14
- Vereinheitlichte Textprioritaet: Rasse+Klasse -> Rasse -> Klasse -> Allgemein.
- Robuster ziel/gruppen-Fallback.
- Erweiterter DE/EN/FR-Social-Textvorrat.

Aenderungen an RPChatMod. Die TOC weist derzeit Version `0.2.2` aus; fuer
nicht dokumentierte Zwischenversionen werden keine Eintraege rekonstruiert.

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
