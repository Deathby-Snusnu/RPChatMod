# RP Chat Mod

## Beschreibung

RP Chat Mod ergänzt WoW-Emotes um zufällig ausgewählte Rollenspieltexte.
Die Ausgabe kann Deutsch, Englisch oder Französisch sein; die Auswahl
berücksichtigt Rasse, Klasse und ein anvisiertes Ziel. Das Add-on ist
eigenständig und benötigt keine gemeinsame Abhängigkeit mit anderen Add-ons.

Die Animation wird auch dann geplant, wenn Chance, Cooldown oder ein fehlender
Textpool die Textausgabe verhindern. Sie startet standardmäßig nach 0,3 Sekunden.

## Dokumentation

[Sammlungsübersicht](../README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](../RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](../VERPACKUNG.md)

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
| `/rc dance`, `/rc sit`, `/rc sleep`, `/rc thank`, `/rc flirt` | Plant die entsprechende Animation und versucht einen RP-Text. |
| `/rc chance <0-100>` | Textchance als ganze Zahl setzen. |
| `/rc cooldown <0-3600>` | Cooldown in ganzen Sekunden setzen. |
| `/rc channel` | Aktuellen Kanal anzeigen. |
| `/rc channel say\|yell\|group\|party\|raid\|instance\|auto` | Kanalmodus speichern. |
| `/rc language [deDE\|enUS\|frFR]` | RP-Ausgabesprache anzeigen oder setzen. |
| `/rc native on\|off` | Native WoW-Emotes zusätzlich ein- oder ausschalten. |
| `/rc racelanguage [auto\|on\|off]` | Volkssprache für SAY/YELL anzeigen oder steuern. |
| `/rc grouplanguage on\|off` | In Gruppen fuer RP-SAY/YELL die Fraktionssprache verwenden oder abschalten. |
| `/rc languagestatus` | Effektive Sprach-ID, Gruppenzustand und Chatkanal anzeigen. |
| `/rc racelangdebug` | Erkannte Rasse, erwartete Sprach-ID und verfügbare Clientsprachen anzeigen. |
| `/rc langdebug` | Diagnose der geladenen Sprachdaten anzeigen. |

Befehle und Emote-Namen unterscheiden nicht zwischen Groß- und Kleinschreibung.
Unbekannte Befehle werden als Emote-Namen behandelt. Ungültige Zahlen,
Dezimalwerte und zusätzliche Argumente werden abgelehnt, nicht begrenzt.

### Kanäle

- `say`: immer `SAY`.
- `yell`: immer `YELL`.
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
| `outputLanguage` | `deDE` | RP-Textdaten: `deDE`, `enUS` oder `frFR`; fehlende Pools fallen auf Deutsch zurück. |
| `racialLanguageMode` | `auto` | `auto`: nur erkannte Volkssprache; `on`: bekannte Rassen-Sprach-ID erzwingen; `off`: Standardsprache. |
| `groupLanguageMode` | `on` | In Gruppen RP-SAY/YELL auf Fraktionssprache umstellen; allein Volkssprache verwenden. |
| `textChance` | `30` | Ganze Zahl 0–100; 0 verhindert Text, 100 versucht bei jedem bereiten Emote einen Text. |
| `cooldown` | `20` | Ganze Zahl 0–3600 Sekunden; 0 deaktiviert die Wartezeit. |
| `emoteDelay` | `0.3` | Verzögerung bis zur Animation. |
| `chatChannel` | `SAY` | SAY, YELL, GROUP, PARTY, RAID, INSTANCE_CHAT oder AUTO. |
| `nativeEmotes` | `false` | Native WoW-Emote-Ausgaben zusätzlich zu RPChatMod-Texten. |

`/rc language` zeigt die aktive RP-Ausgabesprache, ein Argument wechselt sie.
Fehlende Pools einer Sprache fallen auf Deutsch zurück. Die Volkssprache für
SAY/YELL bleibt davon getrennt.

Die Volkssprache wird mit `/rc racelanguage` gesteuert. `auto` verwendet die
Rassensprache nur, wenn der Client sie als gelernt/verfügbar meldet. `on`
verwendet die bekannte Sprach-ID der Rasse auch dann, wenn die Forever-API sie
nicht sauber in der Sprachliste meldet. `off` sendet ohne erzwungene
Volkssprache. `/rc racelangdebug` zeigt die Erkennung im laufenden Client.

Cooldown wird vor Chance und Textauswahl geprüft. Der erste Text ist sofort
möglich. Nach einem erfolgreichen Chat-API-Aufruf beginnt der Cooldown;
eine serverseitige Zustellung wird nicht bestätigt. Chancefehlschlag,
fehlender Pool, nicht verfügbarer Kanal oder abgelehnter Text starten
keinen Cooldown.

## Eigene Texte

Bearbeite die passenden Dateien unter `locales/<locale>/`, zum Beispiel
`General.lua`, `Races.lua`, `Classes.lua` oder `RaceClass.lua`. Es gibt keinen
Ingame-Texteditor.

Die Suche verwendet den ersten vorhandenen Emote-Pool in dieser Reihenfolge:

1. Rasse und Klasse
2. Rasse
3. Klasse
4. allgemeine Texte

Zuerst wird die gewählte Ausgabesprache durchsucht, bei fehlendem Pool Deutsch.
Innerhalb eines strukturierten Pools wird bei vorhandenem Zielnamen zuerst
`ziel`, danach `gruppe` versucht. Danach können auch zielunabhängige Einträge
aus `ziel` verwendet werden. Ohne Namen werden Einträge mit `%s`
ausgeschlossen. Gruppentexte benötigen keine Gruppe. Ein vorhandener, aber
unbrauchbarer höher priorisierter Pool führt nicht zur Suche in einem
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
├── locales/
│   ├── Init.lua
│   ├── deDE/ (General.lua, Races.lua, Classes.lua, RaceClass.lua)
│   ├── enUS/ (General.lua, Races.lua, Classes.lua, RaceClass.lua)
│   ├── frFR/ (General.lua, Races.lua, Classes.lua, RaceClass.lua)
│   └── Finalize.lua
├── core/
│   ├── Database.lua
│   ├── Text.lua
│   ├── Chat.lua
│   ├── Cooldown.lua
│   ├── Commands.lua
│   ├── Emotes.lua
│   └── Random.lua
├── tests/test_addon.lua
├── CHANGELOG.md
├── README.md
└── LICENSE
```

Die Module erhalten über `local _, addon = ...` die private Addon-Tabelle.
Die Hauptdatei registriert `/rc`, exportiert die öffentliche API und
initialisiert die DB beim Login. Textbestände und Auswahlprioritäten bleiben
AddOn-spezifisch.
Die parallel vorhandenen Dateien unter `data/` sind nicht in der TOC-
Ladefolge enthalten; die Laufzeittexte liegen in den Locale-Dateien.
Die TOC lädt außerdem `Expansion.lua` je Sprache mit zusätzlichen Texten;
diese Dateien werden nicht von RP Text Studio bearbeitet.
Die gemeinsamen Kernfunktionen heißen `BuildText`, `SendText`,
`CooldownReady` und `StartCooldown`. `GetText` und `UpdateCooldown` bleiben
als interne Aliase erhalten; die dokumentierten globalen
`RPChatMod_*`-Integrationswrapper bleiben unverändert.

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

- Die TOC weist `Interface: 16001` und Version `0.3.2` aus. Das ist keine
  Zusicherung für andere Clientversionen.
- Der Add-on-Code bleibt Lua-5.1-kompatibel; der Testloader unterstützt auch 5.4.
- Versand verwendet `C_ChatInfo.SendChatMessage`, ohne Legacy-Fallback.
- Sprachwahl erfolgt über sprachunabhängige IDs bekannter Volkssprachen.
- WoWs Rassentoken `Scourge` wird auf die vorhandenen `Undead`-Textdaten normalisiert.
- Texte sind nicht auf Paladine beschränkt.
- Aufrufe vor `PLAYER_LOGIN` werden sicher mit einer Meldung abgelehnt.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).

## Rassenspezifische soziale Interaktionen

RPChatMod priorisiert **Rasse+Klasse -> Rasse -> Klasse -> Allgemein**.
Die sozialen Interaktionen `HELLO`, `WAVE`, `SALUTE`, `BOW`, `LAUGH`, `DANCE`,
`SIT`, `SLEEP`, `THANK` und `FLIRT` besitzen Rassenpools. Unterstützt werden
Menschen, Zwerge, Gnome, Nachtelfen, Himmelsgeborene, Draenei, Orcs, Trolle,
Tauren, Untote und Blutelfen.

Die konfigurierbare RP-Ausgabesprache (deDE/enUS/frFR) ist von der
**Volkssprache** getrennt. Bei `SAY` und `YELL` nutzt das Addon die dem Volk
zugeordnete und auf dem Charakter verfügbare Sprache; Gruppenkanäle erhalten
keine erzwungene Sprach-ID.

### Automatische Volkssprache und Gruppensprache (ab 0.3.3)

Bei `/rc grouplanguage on` wird fuer jede von RPChatMod gesendete
`/say`- oder `/yell`-Nachricht der aktuelle Gruppenstatus geprueft.
Allein wird die Volkssprache nach `/rc racelanguage auto|on|off`
verwendet, in Gruppen Gemeinsprache (Allianz, ID 7) oder Orkisch
(Horde, ID 1). Beim Verlassen einer Gruppe wird die naechste RP-Nachricht
wieder in Volkssprache gesendet. `/rc grouplanguage off` deaktiviert
die Gruppenregel. `/rc languagestatus` zeigt die aktuelle Auswahl.

**Grenze:** Die WoW-Standardsprache des normalen Chat-Eingabefelds wird
nicht umgeschaltet; die Regel betrifft ausschliesslich RPChatMod-Ausgaben.
Die Sprachauswahl fuer `/me`/EMOTE ist davon nicht betroffen.
`/rc language deDE|enUS|frFR` waehlt die Textvorlagen-Sprache,
nicht die Volkssprache im WoW-Chat.
