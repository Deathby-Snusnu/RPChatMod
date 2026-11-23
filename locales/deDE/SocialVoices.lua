-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Additive social voice text pools; all lines are original.
-- Opt-in automatic events are deliberately NOT used.
local _, addon = ...
local locale = addon.localeData.deDE

local function append(pool, lines)
    if type(pool) ~= "table" then return end
    for _, line in ipairs(lines) do
        local exists = false
        for _, old in ipairs(pool) do if old == line then exists = true; break end end
        if not exists then pool[#pool + 1] = line end
    end
end
local function extend(parent, key, ziel, gruppe)
    if type(parent) ~= "table" then return end
    parent[key] = parent[key] or { ziel = {}, gruppe = {} }
    append(parent[key].ziel, ziel)
    append(parent[key].gruppe, gruppe)
end

-- An existing race-specific THANK pool is reachable via /rc thank.
extend(locale.raceTexts.Dwarf, "THANK", { "Habt Dank, %s! Der nächste Krug geht auf mich." }, { "Eure Hilfe ist mehr wert als ein ganzer Stollen voller Erz." })
extend(locale.raceTexts.Gnome, "THANK", { "Prächtig, %s! Alle Messgeräte sind begeistert." }, { "Danke! Das Experiment hat jetzt eine Überlebenschance." })
extend(locale.raceTexts.Human, "THANK", { "Meinen aufrichtigen Dank, %s." }, { "Solche Hilfe hält unsere Gemeinschaft zusammen." })
extend(locale.raceTexts.NightElf, "THANK", { "Mögen die Sterne Eure Güte erwidern, %s." }, { "Mein Dank folgt Euch wie ein leiser Wind." })
extend(locale.raceTexts.Skyborne, "THANK", { "Der Himmel schenke Euch Rückenwind, %s." }, { "Mit Eurer Hilfe reicht der Blick weiter als der Horizont." })
extend(locale.raceTexts.Draenei, "THANK", { "Das Licht möge Eure Wege erhellen, %s." }, { "Für Eure Güte danke ich von Herzen." })
extend(locale.raceTexts.Orc, "THANK", { "Eure Tat verdient Respekt, %s." }, { "Stärke wächst, wenn wir einander beistehen." })
extend(locale.raceTexts.Troll, "THANK", { "Die Loa mögen auf Euch achten, %s!" }, { "Ha! So hilft man einem Freund!" })
extend(locale.raceTexts.Tauren, "THANK", { "Die Erdenmutter segne Euch, %s." }, { "Eure Hilfe trägt wie fester Boden." })
extend(locale.raceTexts.Undead, "THANK", { "Nicht übel, %s. Ich bin beinahe gerührt." }, { "Danke. Mein Herz würde höher schlagen, hätte es Lust dazu." })
extend(locale.raceTexts.BloodElf, "THANK", { "Eine ausgesprochen elegante Hilfe, %s." }, { "Eure Magie verdient Anerkennung." })

-- Class FAREWELL pools add distinctive departures without a combat event.
extend(locale.classTexts.WARRIOR, "FAREWELL", {}, { "Ich gehe vor. Wer nicht mitkommt, möge die Tür schließen.", "Der Schild kommt mit. Die Müdigkeit bleibt hier." })
extend(locale.classTexts.PALADIN, "FAREWELL", {}, { "Das Licht begleite Euch. Der Hammer begleitet mich.", "Ich verabschiede mich im Licht und hoffe auf eine volle Schenke." })
extend(locale.classTexts.HUNTER, "FAREWELL", {}, { "Die Spur führt weiter. Wir sehen uns am nächsten Lagerfeuer.", "Ich gehe voraus. Falls ich mich verlaufe, fragt meinen Begleiter." })
extend(locale.classTexts.ROGUE, "FAREWELL", {}, { "War schön, Euch nicht gesehen zu haben.", "Ich bin dann fort. Diese Unterhaltung hat nie stattgefunden." })
extend(locale.classTexts.PRIEST, "FAREWELL", {}, { "Mögen Licht und Ruhe Eure Schritte begleiten.", "Ich muss weiter. Auch die Stille verdient einen Augenblick." })
extend(locale.classTexts.SHAMAN, "FAREWELL", {}, { "Die Elemente rufen. Ich sollte besser zuhören.", "Möge der Wind Euch sicher geleiten." })
extend(locale.classTexts.MAGE, "FAREWELL", {}, { "Ich muss fort. Der Kessel beginnt wieder verdächtig zu leuchten.", "Falls es gleich knallt: Das war ein kontrollierter Abschied." })
extend(locale.classTexts.WARLOCK, "FAREWELL", {}, { "Ich muss gehen. Mein Schatten wird ungeduldig.", "Bleibt gesund. Ich habe heute keine Ersatzseelen dabei." })
extend(locale.classTexts.DRUID, "FAREWELL", {}, { "Der Wald ruft mich zurück. Lebt wohl.", "Wir begegnen uns wieder, wenn der Wind die Blätter wendet." })

-- Known character combinations override generic race greetings.
locale.raceClassTexts.Gnome = locale.raceClassTexts.Gnome or {}
locale.raceClassTexts.Gnome.MAGE = locale.raceClassTexts.Gnome.MAGE or {}
extend(locale.raceClassTexts.Gnome.MAGE, "HELLO", {}, { "Seid gegrüßt! Das Knistern ist laut Messprotokoll vollkommen harmlos.", "Guten Tag! Hat jemand meine dimensionsstabile Steckdose gesehen?" })
extend(locale.raceClassTexts.Gnome.MAGE, "THANK", { "Danke, %s! Meine Berechnungen sagen: ausgezeichnete Entscheidung." }, { "Wunderbar! Die Erfolgswahrscheinlichkeit liegt wieder über null." })
extend(locale.raceClassTexts.Gnome.MAGE, "FAREWELL", {}, { "Ich muss los. Die Versuchsanordnung qualmt schon in meiner Abwesenheit.", "Auf Wiedersehen! Bitte nichts anfassen, das meine Handschrift trägt." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.HUNTER = locale.raceClassTexts.Dwarf.HUNTER or {}
extend(locale.raceClassTexts.Dwarf.HUNTER, "HELLO", {}, { "Grüß Euch! Wer hat einen trockenen Platz für Stiefel und Begleiter?", "Bei meinem Bart! Ein guter Tag für frische Fährten." })
extend(locale.raceClassTexts.Dwarf.HUNTER, "THANK", { "Habt Dank, %s! Mein Begleiter und ich stehen in Eurer Schuld." }, { "Ein guter Gefährte ist mehr wert als der beste Schuss. Danke!" })
extend(locale.raceClassTexts.Dwarf.HUNTER, "FAREWELL", {}, { "Die Fährte ruft. Wenn Ihr Schnarchen hört, war's mein Begleiter.", "Ich ziehe weiter. Der Weg wird nicht kürzer, wenn man ihn anstarrt." })
locale.raceClassTexts.Dwarf = locale.raceClassTexts.Dwarf or {}
locale.raceClassTexts.Dwarf.PALADIN = locale.raceClassTexts.Dwarf.PALADIN or {}
extend(locale.raceClassTexts.Dwarf.PALADIN, "HELLO", {}, { "Stein, Stahl und Licht! Hat jemand den Morgen gesehen?", "Grüßt Euch! Ich bringe Segen, Hammer und mächtigen Durst." })
extend(locale.raceClassTexts.Dwarf.PALADIN, "THANK", { "Habt Dank, %s! Möge das Licht Euren Krug niemals leeren." }, { "Das war ein wahrer Segen. Und das sage ich als Fachmann!" })
extend(locale.raceClassTexts.Dwarf.PALADIN, "FAREWELL", {}, { "Das Licht ruft. Oder die Schenke. Ich prüfe beides.", "Bleibt standhaft! Und lasst mir noch einen Humpen übrig." })
