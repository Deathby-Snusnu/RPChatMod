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

Die Textchance und den Cooldown kannst du im Spiel einstellen:

```text
/rc chance 50
/rc cooldown 15
```

Die Textchance wird auf 0 bis 100 Prozent begrenzt; `0` unterbindet RP-Texte,
`100` versucht bei jedem Emote einen Text zu senden. Der Cooldown wird in
Sekunden angegeben; `0` deaktiviert die Wartezeit. Beide Werte werden pro
Charakter gespeichert und bleiben nach einem `/reload` oder Neustart erhalten.

Wenn ein gültiges Ziel anvisiert ist und für den Textpool ein Zieltext
vorhanden ist, wird zufällig ein Zieltext gewählt und `%s` durch den Namen des
Ziels ersetzt. Andernfalls wird ein Gruppentext ausgewählt. Die Textpools
werden in folgender Reihenfolge gesucht:

1. Kombination aus Rasse und Klasse
2. Klasse
3. Rasse
4. allgemeine Texte

Standardmäßig wird die Nachricht immer im Sagen-Kanal gesendet, auch wenn der
Charakter in einer Gruppe, einem Schlachtzug oder einer Instanzgruppe ist. Der
Kanal lässt sich im Spiel auswählen:

```text
/rc channel say
/rc channel group
/rc channel instance
/rc channel auto
```

`group` verwendet den Gruppenkanal beziehungsweise im Schlachtzug den
Schlachtzugskanal. `instance` verwendet den Instanzgruppenkanal. Ist der
gewählte Gruppenkanal gerade nicht verfügbar, wird stattdessen `SAY` verwendet.
`auto` wählt automatisch den Instanzgruppen-, Schlachtzugs- oder Gruppenkanal
und fällt andernfalls auf `SAY` zurück. Die Auswahl wird pro Charakter
gespeichert.

## Einstellungen

Die Standardwerte stehen in `config/Settings.lua`:

| Einstellung | Standard | Beschreibung |
| --- | ---: | --- |
| `textChance` | `30` | Prozentuale Chance (0–100), dass ein RP-Text gesendet wird. Ingame änderbar mit `/rc chance <0-100>`. |
| `cooldown` | `20` | Mindestabstand in Sekunden zwischen gesendeten RP-Texten. Ingame änderbar mit `/rc cooldown <Sekunden>`. |
| `emoteDelay` | `0.3` | Verzögerung in Sekunden vor dem Abspielen der Animation. |
| `chatChannel` | `"SAY"` | Ausgabeziel: `SAY`, `GROUP`, `INSTANCE_CHAT` oder `AUTO`; im Spiel mit `/rc channel say|group|instance|auto` änderbar. |

Der Cooldown wird nach einem gesendeten RP-Text gestartet. Eine nicht
ausgelöste Textchance oder ein fehlender Textpool startet ihn nicht.
Die per Slash-Befehl eingestellte Textchance und Abklingzeit werden separat je
Charakter gespeichert.

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
