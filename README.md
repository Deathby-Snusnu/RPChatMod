# RP Chat Mod

RP Chat Mod ergänzt ausgewählte WoW-Emotes um zufällig ausgewählte,
deutschsprachige Rollenspieltexte. Die Textauswahl kann Rasse und Klasse des
Charakters sowie ein anvisiertes Ziel berücksichtigen.

## Installation

Der Ordner `RPChatMod` muss im Add-on-Verzeichnis des WoW-Clients liegen:

```text
World of Warcraft/<Client>/Interface/AddOns/RPChatMod/
```

Die Add-on-Datei `RPChatMod.toc` enthält die Dateiliste und Lade-Reihenfolge.
Nach dem Kopieren das Add-on im Charakter-Auswahlbildschirm aktivieren oder im
Spiel mit `/reload` neu laden.

## Verwendung

Der Befehl `/rc` gefolgt von einem Emote-Namen spielt die zugehörige WoW-
Animation ab und versucht, zusätzlich einen RP-Text im Chat auszugeben:

```text
/rc hello
/rc wave
/rc salute
/rc bow
/rc laugh
/rc dance
/rc sit
/rc sleep
/rc thank
```

Der Emote-Name wird ohne Beachtung der Groß-/Kleinschreibung verarbeitet.
Ohne Argument zeigt `/rc` diese Befehlsliste an. Die Animation wird auch dann
ausgeführt, wenn kein Text gesendet wird, etwa aufgrund der Textchance oder
Abklingzeit.

Wenn ein gültiges Ziel anvisiert ist und für den Textpool ein Zieltext
vorhanden ist, wird zufällig ein Zieltext gewählt und `%s` durch den Namen des
Ziels ersetzt. Andernfalls wird ein Gruppentext ausgewählt. Die Textpools
werden in folgender Reihenfolge gesucht:

1. Kombination aus Rasse und Klasse
2. Klasse
3. Rasse
4. allgemeine Texte

Die Nachricht wird im Sagen-Kanal gesendet, wenn der Charakter nicht in einer
Gruppe oder Instanz ist, im Gruppenkanal bei einer Gruppe und im
Instanzgruppenkanal, wenn der Charakter in einer Instanz ist oder einer
Instanzgruppe angehört.

## Einstellungen

Die Standardwerte stehen in `config/Settings.lua`:

| Einstellung | Standard | Beschreibung |
| --- | ---: | --- |
| `textChance` | `40` | Prozentuale Chance (1–100), dass ein RP-Text gesendet wird. |
| `cooldown` | `10` | Mindestabstand in Sekunden zwischen gesendeten RP-Texten. |
| `emoteDelay` | `0.3` | Verzögerung in Sekunden vor dem Abspielen der Animation. |
| `chatChannel` | `"AUTO"` | Wird derzeit beim Senden nicht ausgewertet. Der Chatkanal wird automatisch anhand des Gruppen- und Instanzstatus gewählt (siehe oben). |

Der Cooldown wird nach einem gesendeten RP-Text gestartet. Eine nicht
ausgelöste Textchance oder ein fehlender Textpool startet ihn nicht.

## Projektstruktur

```text
RPChatMod/
├── RPChatMod.toc
├── RPChatMod.lua
├── config/
│   └── Settings.lua
├── core/
│   ├── Chat.lua
│   ├── Cooldown.lua
│   ├── Emotes.lua
│   └── Random.lua
├── data/
│   ├── General.lua
│   ├── Races.lua
│   ├── Classes.lua
│   └── RaceClass.lua
├── LICENSE
├── CHANGELOG.md
└── README.md
```

Die `.toc` lädt zuerst Einstellungen und Textdaten, danach die Kernfunktionen
und zuletzt den Einstiegspunkt mit dem `/rc`-Befehl.

## Hinweise

- Die `.toc` weist `Interface: 16001` und Version `0.1.0` aus.
- Nicht jeder Textpool muss für jedes Emote, jede Rasse oder jede Klasse
  Einträge enthalten; in diesem Fall greift die beschriebene Fallback-Reihenfolge.
- Änderungen an den Lua-Dateien werden nach einem `/reload` wirksam.

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Den vollständigen Lizenztext findest
du in der Datei [LICENSE](LICENSE).
