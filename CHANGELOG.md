# Changelog

Änderungen am Add-on werden in diesem Dokument festgehalten. Eine frühere
Änderungshistorie liegt nicht vor; der folgende Abschnitt hält daher den
vorhandenen Quellstand fest und behauptet keinen veröffentlichten Release.

## Unveröffentlicht

- `/rc chance <0-100>` und `/rc cooldown <Sekunden>` konfigurieren die
  Textwahrscheinlichkeit und Abklingzeit im Spiel. Beide Einstellungen werden
  pro Charakter gespeichert.

## Ausgangsstand (Versionsnummer in der TOC: 0.1.0)

- Dokumentation der vorhandenen Add-on-Funktionen in der README ergänzt.
- Der `/rc`-Befehl unterstützt die Emotes `wave`, `salute`, `bow`, `laugh`,
  `dance`, `sit`, `sleep`, `thank` und `hello`.
- RP-Texte werden zufällig aus rassen-, klassen-, rassen-/klassen- oder
  allgemeinen Textpools ausgewählt und können abhängig von Ziel und Gruppe
  variieren. Für alle neun unterstützten Emotes gibt es nun Texte für die fünf
  in `data/Races.lua` aufgeführten Rassen.
- Einstellungen für Textchance, Abklingzeit, Animationsverzögerung und
  Chatkanal sind dokumentiert. `chatChannel` wird derzeit beim Senden nicht
  ausgewertet; der Chatkanal wird automatisch anhand des Gruppen- und
  Instanzstatus gewählt.
