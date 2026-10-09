# RP Chat Mod

## Beschreibung

RP Chat Mod ergänzt WoW-Emotes um zufällig ausgewählte deutschsprachige
Rollenspieltexte. Die Auswahl berücksichtigt Rasse, Klasse und ein anvisiertes
Ziel. Das Add-on ist eigenständig und benötigt keine gemeinsame Abhängigkeit
mit anderen Add-ons.

Die Animation wird auch dann geplant, wenn Chance, Cooldown oder ein fehlender
Textpool die Textausgabe verhindern. Sie startet standardmäßig nach 0,3 Sekunden.

## Installation

Kopiere den Ordner `RPChatMod` in das Add-on-Verzeichnis deines WoW-Clients:

```text
<WoW-Installationsordner>\<Client>\Interface\AddOns\RPChatMod
```

Aktiviere das Add-on im Charakter-Auswahlbildschirm beziehungsweise lade es
mit `/reload` neu. Die [TOC](RPChatMod.toc) bestimmt die Ladefolge.
Das Installations-ZIP enthält Spieldateien, Dokumentation und Lizenz,
aber keine Tests, Git- oder Editor-Dateien.

## Schnellstart

```text
/rc hello
/rc wave
/rc chance 50
/rc cooldown 15
/rc channel group
```

Standardmäßig beträgt die Textchance 30 %, der Cooldown 20 Sekunden und der
Chatkanal `SAY`. Die Einstellungen für Chance, Cooldown und Kanal werden pro
Charakter gespeichert.

## Befehle

| Befehl | Funktion |
| --- | --- |
| `/rc` oder `/rc help` | Zeigt die Hilfe. |
| `/rc list` | Listet die allgemeinen Emote-Textschlüssel auf. |
| `/rc status` | Zeigt die aktuellen Einstellungen. |
| `/rc hello`, `/rc wave`, `/rc salute`, `/rc bow`, `/rc laugh` | Plant die entsprechende Animation und versucht einen RP-Text. |
| `/rc dance`, `/rc sit`, `/rc sleep`, `/rc thank` | Plant die entsprechende Animation und versucht einen RP-Text. |
| `/rc chance <0-100>` | Textchance als ganze Zahl setzen. |
| `/rc cooldown <0-3600>` | Cooldown in ganzen Sekunden setzen. |
| `/rc channel` | Aktuellen Kanal anzeigen. |
| `/rc channel say\|group\|party\|raid\|instance\|auto` | Kanalmodus speichern. |

Befehle und Emote-Namen unterscheiden nicht zwischen Groß- und Kleinschreibung.
Unbekannte Befehle werden als Emote-Namen behandelt. Ungültige Zahlen,
Dezimalwerte und zusätzliche Argumente werden abgelehnt, nicht begrenzt.

### Kanäle

- `say`: immer `SAY`.
- `group`: zuerst Instanzgruppe, dann Schlachtzug, dann Gruppe.
- `party`: gezielt `PARTY`.
- `raid`: gezielt `RAID`.
- `instance` oder `instance_chat`: gezielt `INSTANCE_CHAT`.
- `auto`: zuerst Instanzgruppe, dann Schlachtzug, dann Gruppe; andernfalls `SAY`.

Ein nicht verfügbarer expliziter Gruppenkanal, auch `group` ohne Gruppe,
bricht die Textausgabe mit einer Meldung ab. Nur `auto` darf auf SAY
zurückfallen. Die Emote-Animation wird trotzdem geplant.

## Einstellungen

Die Standardwerte stehen in [config/Settings.lua](config/Settings.lua) unter
`addon.defaults`. `RPChatMod_CharacterDB` bleibt die Charakter-SavedVariable
und ist die Laufzeitquelle für Chance, Cooldown und Kanal.
Initialisiert wird bei `PLAYER_LOGIN`. Gültige gespeicherte Werte bleiben
erhalten; beschädigte Werte werden mit einer Meldung repariert.

| Einstellung | Standard | Beschreibung |
| --- | ---: | --- |
| `textChance` | `30` | Ganze Zahl 0–100; 0 verhindert Text, 100 versucht bei jedem bereiten Emote einen Text. |
| `cooldown` | `20` | Ganze Zahl 0–3600 Sekunden; 0 deaktiviert die Wartezeit. |
| `emoteDelay` | `0.3` | Verzögerung bis zur Animation. |
| `chatChannel` | `"SAY"` | SAY, GROUP, PARTY, RAID, INSTANCE_CHAT oder AUTO. |

Cooldown wird vor Chance und Textauswahl geprüft. Der erste Text ist sofort
möglich. Nach einem erfolgreichen Chat-API-Aufruf beginnt der Cooldown;
eine serverseitige Zustellung wird nicht bestätigt. Chancefehlschlag,
fehlender Pool, nicht verfügbarer Kanal oder abgelehnter Text starten
keinen Cooldown.

## Eigene Texte

Bearbeite die vorhandenen Tabellen in [data/General.lua](data/General.lua),
[data/Races.lua](data/Races.lua), [data/Classes.lua](data/Classes.lua) oder
[data/RaceClass.lua](data/RaceClass.lua). Es gibt keinen Ingame-Texteditor.

Die Suche verwendet den ersten vorhandenen Emote-Pool in dieser Reihenfolge:

1. Rasse und Klasse
2. Klasse
3. Rasse
4. allgemeine Texte

Innerhalb des Pools wird bei vorhandenem Ziel und Namen ein Eintrag aus `ziel`
gewählt; andernfalls ein Eintrag aus `gruppe`. Gruppentexte benötigen keine
Gruppe. Ein leerer höher priorisierter Pool führt nicht zur Suche in einem
niedriger priorisierten Pool.

`%s` wird literal durch den Zielnamen ersetzt; andere Prozentzeichen bleiben
unverändert. Ohne Ziel werden Texte mit `%s` nicht ausgegeben.
Nach der Ersetzung gelten maximal 255 Bytes, keine Zeilenumbrüche und
keine `|`-Chatmarkierungen.
Nach Änderungen an Quelldateien ist `/reload` erforderlich.

## Projektstruktur

```text
RPChatMod/
├── RPChatMod.toc
├── RPChatMod.lua
├── config/Settings.lua
├── core/
│   ├── Database.lua
│   ├── Text.lua
│   ├── Chat.lua
│   ├── Cooldown.lua
│   ├── Commands.lua
│   ├── Emotes.lua
│   └── Random.lua
├── data/
│   ├── General.lua
│   ├── Races.lua
│   ├── Classes.lua
│   └── RaceClass.lua
├── tests/test_addon.lua
├── CHANGELOG.md
├── README.md
└── LICENSE
```

Die Module erhalten über `local _, addon = ...` die private Addon-Tabelle.
Die Hauptdatei registriert `/rc`, exportiert die öffentliche API und
initialisiert die DB beim Login. Textbestände und Auswahlprioritäten bleiben
AddOn-spezifisch.

### Bestehende Integrationsschnittstellen

Die globalen Funktionen bleiben als dünne Wrapper erhalten:

- `RPChatMod_GetChatChannel()`
- `RPChatMod_SendText(text)`
- `RPChatMod_CooldownReady()`
- `RPChatMod_GetRemainingCooldown()`
- `RPChatMod_UpdateCooldown()`
- `RPChatMod_PlayEmote(emote)`
- `RPChatMod_GetRandom(list)`

Kanalabfragen liefern einen String oder bei Ablehnung `nil`, der Versand
liefert `true` nach einem erfolgreichen Chat-API-Aufruf, sonst `false`.
Cooldown-Prüfung, Restzeit und Zufallsauswahl behalten ihre bisherigen
Rückgabetypen. Cooldown-Aktualisierung und Animationsplanung liefern `nil`.

Die öffentliche API `RPChatMod.TryText(emote)` beziehungsweise
`RPChatMod.DoEmote(emote)` plant die Animation und versucht die Textausgabe.
Sie liefert `true` nach dem Chat-API-Aufruf, sonst `false`, und lehnt Aufrufe
vor dem Login sicher ab. Beispiel:

```text
/run RPChatMod.TryText("HELLO")
```

`RPChatMod_Settings` und die vier globalen Texttabellen entfallen.
Interne Module nutzen die AddOn-Tabelle; gespeicherte Charakterwerte bleiben
unter demselben Datenbanknamen erhalten.

## Tests

Die [Regressionstests](tests/test_addon.lua) laden die Lua-Dateien anhand der
TOC in einer isolierten Mock-Umgebung. Aus dem Add-on-Verzeichnis:

```text
lua tests\test_addon.lua
```

Alternativ kann ein absoluter Pfad zur Testdatei und als erstes Argument der
Addon-Ordner angegeben werden. Die Namen der Interpreter hängen von deiner
Installation ab.

Die Tests sind **source-only**, stehen nicht in der TOC und werden nicht von
WoW geladen und fehlen im Installations-ZIP. Sie prüfen DB-Erhaltung,
Defaults, Wrapper, Kanalverfügbarkeit, Poolpriorität, Zieltexte, Chancen,
Cooldown, unabhängige Animation, strikte Befehlsgrammatik und Fehlerfälle.

Mock-Tests ersetzen keinen Test im WoW-Client.

## Kompatibilität

- Die TOC weist `Interface: 16001` und Version `0.1.0` aus. Das ist keine
  Zusicherung für andere Clientversionen.
- Der Add-on-Code bleibt Lua-5.1-kompatibel; der Testloader unterstützt auch 5.4.
- Versand verwendet `C_ChatInfo.SendChatMessage`, ohne Legacy-Fallback.
- Sprachwahl erfolgt über sprachunabhängige IDs bekannter Volkssprachen.
- WoWs Rassentoken `Scourge` wird auf die vorhandenen `Undead`-Textdaten normalisiert.
- Texte sind nicht auf Paladine beschränkt.
- Aufrufe vor `PLAYER_LOGIN` werden sicher mit einer Meldung abgelehnt.

## Lizenz

MIT-Lizenz, Copyright (c) 2026 Hannes. Siehe [LICENSE](LICENSE).
Änderungen werden im [CHANGELOG](CHANGELOG.md) dokumentiert.
